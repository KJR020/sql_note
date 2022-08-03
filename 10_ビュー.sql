/* 
テーブルとビュー
テーブル	
- 実際のデータを保存
ビュー	
-　ビューの中にはselect文が保存され、ビュー自体はデータを持たない
ビューの制限
- order by句が使えない
- ビューに対する更新は不可能ではないが、制限がある。
メリット
メモリを使わない
デメリット
パフォーマンスの低下を招く恐れがある
*/

create view prefecture_user_counts(name, count)
as 
select 
	p.name name,
    count(*) count
from
	users u
inner join
	prefectures p
on u.prefecture_id = p.id
group by
	u.prefecture_id    
    ;
   
select
	name,
    count
from prefecture_user_counts;

-- viewの削除 drop
drop view prefecture_user_counts;