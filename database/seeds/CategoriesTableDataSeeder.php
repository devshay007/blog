<?php

use Illuminate\Database\Seeder;
use App\Category;

class CategoriesTableDataSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        
        DB::table('categories')->delete();
        $categories=array(
        	array('name'=>'Cat 1'),
        	array('name'=>'Cat 2'),
        	array('name'=>'Cat 3'),
        	array('name'=>'Cat 4'),
        	array('name'=>'Cat 5'),
        	array('name'=>'Cat 6'),
        	array('name'=>'Cat 7'),
        	array('name'=>'Cat 8'),
        	array('name'=>'Cat 9'),
        	array('name'=>'Cat 10'),
        );
        Category::insert($categories);

    }
}
