require'tilt';require'rack';class Sword;M=(R=Rack)::Mime::MIME_TYPES.invert;P=
'PATH_INFO';class<<self;def g(p,&b);@@r[p]=b;end;alias:m:new;def new;@@x.run m
@@x end;@@r||={};@@x=R::Builder.new;def w;@@r.clear;@@x.instance_eval{@use.clear
};_ end;def _;@@s=[];Dir['**/*'].each{|f|(t=Tilt[f])?g("/#{f.chomp File.extname(
f)}#{M[m=t.default_mime_type]}"){q m;t.new(f).render(self)}:@@s<<"/#{f}"};@@x.
use(R::Static,:urls=>@@s);g(i='/favicon'<<z='.ico'){q M.key z;File.read"#{File.
dirname __FILE__}#{i}"}end end;def q t;@c.headers['Content-Type']=t;end;def
call a;@a=a;@b=R::Request.new@a;@c=R::Response.new;l=@@r[@b.path_info];@c.write(
instance_eval(&l ?l:proc{|e|@@r[i="#{(n=@a[P]).chomp'/'}/index.html"]?call(@a.
merge P=>i)[-1]:(Sword.w;@@r[n]||@@s.include?(n)?@c.redirect(n):'not found')}))
@c.finish end end
