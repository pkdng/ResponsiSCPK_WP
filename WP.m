opts = detectImportOptions('Real estate valuation data set.xlsx'); 
opts.SelectedVariableNames = [3:5 8]; %mengambil kolom 3-5 dan 8
data = readmatrix('Real estate valuation data set.xlsx',opts); %membaca file

x = data(1:50,:); %mengambil data ke-1 sampai ke-50
k = [0,0,1,0]; %nilai atribut, 0=cost, 1=benefit
w = [3,5,4,1]; %bobot masing-masing kriteria

%tahapan pertama, perbaikan bobot
[m n]=size (x); %inisialisasi ukuran x
w=w./sum(w); %membagi bobot per kriteria dengan jumlah total seluruh bobot

%tahapan kedua, melakukan perhitungan vektor(S) per baris (alternatif)
for j=1:n,
    if k(j)==0, w(j)=-1*w(j);
    end;
end;
for i=1:m,
    S(i)=prod(x(i,:).^w);
end;

%tahapan ketiga, proses perangkingan
V= S/sum(S);

[v no] = sort(V,'descend'); %mengurutkan data V dari yang terbesar

for d=1:5,
    hasil = ['Ranking ', num2str(d), ' => Data No-', num2str(no(d)), ' dengan V = ',num2str(v(d))];
    disp(hasil) %menampilkan data 5 teratas
end;