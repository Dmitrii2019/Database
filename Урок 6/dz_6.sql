-- ����� ����� ��������� ������������. �� ���� ������ ����� ������������ ������� ��������, ������� ������ ���� ������� � ����� �������������.
SELECT 
 (SELECT firstname FROM users WHERE id = (from_user_id)) AS name , count(from_user_id) AS letters
FROM messages
WHERE from_user_id IN (
       SELECT initiator_user_id FROM friend_requests WHERE (target_user_id = 1) AND status='approved'
       union
       SELECT target_user_id FROM friend_requests WHERE (initiator_user_id = 1) AND status='approved')
GROUP BY from_user_id 
ORDER BY letters DESC LIMIT 1;

-- ���������� ����� ���������� ������, ������� �������� ������������ ������ 10 ���..

SELECT id, name, FLOOR((TO_DAYS(NOW()) - TO_DAYS(birthday_at))/365.25) AS mean_age 
FROM users
ORDER BY mean_age < 10;

-- ���������� ��� ������ �������� ������ (�����) - ������� ��� �������?

SELECT count(*) AS 'woman' FROM likes WHERE user_id IN (SELECT user_id FROM profiles WHERE gender = 'm')
SELECT count(*) AS 'Man' FROM likes WHERE user_id IN (SELECT user_id FROM profiles WHERE gender = 'f');
-- �� ������� ������� ����������� � �����������




















