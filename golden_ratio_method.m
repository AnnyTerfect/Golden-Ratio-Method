function [min_point] = golden_ratio_method(f, a, b, n)
A = []; B = []; %���Ҷ˵��б�
T1 = []; T2 = []; %�����Ե��б�
lower = []; %���Ե㺯��ֵ�Ƿ�С�����Ե�
A(1) = a; B(1) = b; %�Ե��ֵ
ratio = (sqrt(5) - 1) / 2;
%�趨��ʼ����

T1(1) = b - ratio * (b - a);
T2(1) = a + ratio * (b - a);
%�����׶��Ե�

for k = 2: n - 2
    if f(T1(k - 1)) < f(T2(k - 1))
        A(k) = A(k - 1);
        B(k) = T2(k - 1);
        T2(k) = T1(k - 1);
        T1(k) = B(k) - ratio * (B(k) - A(k));
        lower(k - 1) = true;
    else
        A(k) = T1(k - 1);
        B(k) = B(k - 1);
        T1(k) = T2(k - 1);
        T2(k) = A(k) + ratio * (B(k) - A(k));
        lower(k - 1) = false;
    end
    %���ݺ���ֵ��ϵ�����Ե������˵�
    %ע�������±��1��ʼ����ʽ�з����±��0��ʼ���±����ϸ΢���
end

T1(n - 2) = (A(n - 2) + B(n - 2)) / 2;
T2(n - 2) = T1(n - 2);

for k = 1: n - 3
    disp(['��', num2str(k), '�֣�']);
    disp(['a', num2str(k - 1), ' = ', num2str(A(k)) ' b', num2str(k - 1), ' = ' num2str(B(k))]);
    disp(['t' num2str(k) ' = ' num2str(T1(k)) ' t' num2str(k) ''' = ' num2str(T2(k))]);
    disp(['f(t' num2str(k) ') = ' num2str(f(T1(k))) ' f(t', num2str(k), ''') = ' num2str(f(T2(k)))]);
    if lower(k)
        disp(['f(t', num2str(k), ') < ' 'f(t' num2str(k) ''')']);
    else
        disp(['f(t', num2str(k), ') > ' 'f(t' num2str(k) ''')']);
    end
    fprintf('\n');
end

disp('���һ��');
disp(['t' num2str(n - 2) ' = t' num2str(n - 2) ''' = ' num2str(T2(n - 2))]);
end

