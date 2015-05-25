class dev
{
  $packages = [
    "python-dev",
    "build-essential",
    "libssl-dev",
    "libffi-dev",
    "libxml2-dev",
    "libxslt1-dev",
    "python-lxml",
    "libmysqlclient-dev"
    ]

    package
    {
      $packages:
        ensure  => latest,
    }

}
