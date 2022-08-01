select * from products;
-- 商品一覧を価格が高い順に並び変える
select * from products order by price desc;

-- 商品一覧を価格が低い順に並べて取得
select * from products order by price asc;

select * from products order by price desc, id asc;

-- コラム　漢字の並び替えは、文字コード順に並ぶためアイウエオ順に並べたいなら、読み仮名（カナ）の列を用意するなどの工夫が必要
select * from users;

select * from users order by birthday asc, prefecture_id asc;