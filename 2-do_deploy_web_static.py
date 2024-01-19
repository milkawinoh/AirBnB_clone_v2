#!/usr/bin/python3
from fabric.api import env, put, run
from os.path import exists

# Set the target web server IP addresses
env.hosts = ['<IP web-01>', '<IP web-02>']

def do_deploy(archive_path):
    """
    Distributes an archive to web servers and deploys the content.

    Args:
        archive_path (str): Path to the archive file.

    Returns:
        bool: True if all operations have been done correctly, False otherwise.
    """
    # Check if the specified archive file exists
    if not exists(archive_path):
        return False

    # Upload the archive to the /tmp/ directory on the web servers
    put(archive_path, '/tmp/')

    # Extract information from the archive path to construct release path
    archive_filename = archive_path.split('/')[-1]
    release_path = "/data/web_static/releases/{}".format(archive_filename.split('.')[0])

    # Create the release path on the web server
    run("mkdir -p {}".format(release_path))

    # Uncompress the archive in the specified release path
    run("tar -xzf /tmp/{} -C {}".format(archive_filename, release_path))

    # Remove the uploaded archive from the /tmp/ directory
    run("rm /tmp/{}".format(archive_filename))

    # Move the contents of the uncompressed archive to the release path
    run("mv {}/web_static/* {}".format(release_path, release_path))

    # Remove the 'web_static' directory within the release path
    run("rm -rf {}/web_static".format(release_path))

    # Remove the existing symbolic link at /data/web_static/current
    run("rm -rf /data/web_static/current")

    # Create a new symbolic link pointing to the new release path
    run("ln -s {} /data/web_static/current".format(release_path))

    # Print a success message
    print("New version deployed!")

    # Return True to indicate success
    return True

