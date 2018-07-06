## Mars Explorer

1. Database Seeds
2. HTML Forms
3. Oracle Database Support

### To run the program

First run on the directory where the projects files are

```php
composer install
```

Then make sure you have installed wamp and configured oracle 11g RC2. With Oracle installed, run

```php
php artisan migrate && php artisan seed
```

And you will have a working project

