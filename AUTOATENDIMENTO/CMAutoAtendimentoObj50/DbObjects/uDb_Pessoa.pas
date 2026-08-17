{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 05/07/2002                             }
{                                                       }
{*******************************************************}

unit uDb_Pessoa;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDb_Pessoa = class(TCmDbObject)

  private
    FFlgbolsavalores: TCmDbField;
    FFlgcandidato: TCmDbField;
    FFlgaverbadora: TCmDbField;
    FFlgestrangeiro: TCmDbField;
    FFlgbenefprocuh: TCmDbField;
    FFlgelegivel: TCmDbField;
    FFlgadminimovel: TCmDbField;
    FFlgdependente: TCmDbField;
    FFlgagencia: TCmDbField;
    FFlgusuario: TCmDbField;
    FFlgresponsavel: TCmDbField;
    FFlgsindicato: TCmDbField;
    FFlginstfin: TCmDbField;
    FFlglocatario: TCmDbField;
    FNome: TCmDbField;
    FFlgautarquia: TCmDbField;
    FFlgcotista: TCmDbField;
    FFlghospede: TCmDbField;
    FFlgadminfundo: TCmDbField;
    FFlgadministradora: TCmDbField;
    FIdendcorresp: TCmDbField;
    FFlgcliente: TCmDbField;
    FIdendcomercial: TCmDbField;
    FIdendcobranca: TCmDbField;
    FFlgprodutor: TCmDbField;
    FHomepage: TCmDbField;
    FFlghotel: TCmDbField;
    FFlgterceiro: TCmDbField;
    FFlgcontato: TCmDbField;
    FFlgoutro: TCmDbField;
    FFlginvalido: TCmDbField;
    FFlgconcierge: TCmDbField;
    FIdpessoa: TCmDbField;
    FFlgproprietariouh: TCmDbField;
    FFlgfundacao: TCmDbField;
    FRazaosocial: TCmDbField;
    FFlgvendedor: TCmDbField;
    FIdgrupo: TCmDbField;
    FFlgcorretoravalor: TCmDbField;
    FNumdocumento: TCmDbField;
    FFlgbolsa: TCmDbField;
    FFlgoperadormanut: TCmDbField;
    FFlgavalista: TCmDbField;
    FIdendentrega: TCmDbField;
    FFlgagenciaviagem: TCmDbField;
    FFlgemissor: TCmDbField;
    FSeqtransmissao: TCmDbField;
    FFlgcustodiante: TCmDbField;
    FEmail: TCmDbField;
    FIdimagem: TCmDbField;
    FIdendresidencial: TCmDbField;
    FFlgfilialpessoa: TCmDbField;
    FFlgbanco: TCmDbField;
    FFlggestorfundo: TCmDbField;
    FTipo: TCmDbField;
    FFlgrepresentante: TCmDbField;
    FFlgpatrocinadora: TCmDbField;
    FFlggestorcarteira: TCmDbField;
    FFlgpagador: TCmDbField;
    FFlgfornserv: TCmDbField;
    FFlgfuncionario: TCmDbField;
    procedure SetEmail(const Value: TCmDbField);
    procedure SetFlgadminfundo(const Value: TCmDbField);
    procedure SetFlgadminimovel(const Value: TCmDbField);
    procedure SetFlgadministradora(const Value: TCmDbField);
    procedure SetFlgagencia(const Value: TCmDbField);
    procedure SetFlgagenciaviagem(const Value: TCmDbField);
    procedure SetFlgautarquia(const Value: TCmDbField);
    procedure SetFlgavalista(const Value: TCmDbField);
    procedure SetFlgaverbadora(const Value: TCmDbField);
    procedure SetFlgbanco(const Value: TCmDbField);
    procedure SetFlgbenefprocuh(const Value: TCmDbField);
    procedure SetFlgbolsa(const Value: TCmDbField);
    procedure SetFlgbolsavalores(const Value: TCmDbField);
    procedure SetFlgcandidato(const Value: TCmDbField);
    procedure SetFlgcliente(const Value: TCmDbField);
    procedure SetFlgconcierge(const Value: TCmDbField);
    procedure SetFlgcontato(const Value: TCmDbField);
    procedure SetFlgcorretoravalor(const Value: TCmDbField);
    procedure SetFlgcotista(const Value: TCmDbField);
    procedure SetFlgcustodiante(const Value: TCmDbField);
    procedure SetFlgdependente(const Value: TCmDbField);
    procedure SetFlgelegivel(const Value: TCmDbField);
    procedure SetFlgemissor(const Value: TCmDbField);
    procedure SetFlgestrangeiro(const Value: TCmDbField);
    procedure SetFlgfilialpessoa(const Value: TCmDbField);
    procedure SetFlgfornserv(const Value: TCmDbField);
    procedure SetFlgfuncionario(const Value: TCmDbField);
    procedure SetFlgfundacao(const Value: TCmDbField);
    procedure SetFlggestorcarteira(const Value: TCmDbField);
    procedure SetFlggestorfundo(const Value: TCmDbField);
    procedure SetFlghospede(const Value: TCmDbField);
    procedure SetFlghotel(const Value: TCmDbField);
    procedure SetFlginstfin(const Value: TCmDbField);
    procedure SetFlginvalido(const Value: TCmDbField);
    procedure SetFlglocatario(const Value: TCmDbField);
    procedure SetFlgoperadormanut(const Value: TCmDbField);
    procedure SetFlgoutro(const Value: TCmDbField);
    procedure SetFlgpagador(const Value: TCmDbField);
    procedure SetFlgpatrocinadora(const Value: TCmDbField);
    procedure SetFlgprodutor(const Value: TCmDbField);
    procedure SetFlgproprietariouh(const Value: TCmDbField);
    procedure SetFlgrepresentante(const Value: TCmDbField);
    procedure SetFlgresponsavel(const Value: TCmDbField);
    procedure SetFlgsindicato(const Value: TCmDbField);
    procedure SetFlgterceiro(const Value: TCmDbField);
    procedure SetFlgusuario(const Value: TCmDbField);
    procedure SetFlgvendedor(const Value: TCmDbField);
    procedure SetHomepage(const Value: TCmDbField);
    procedure SetIdendcobranca(const Value: TCmDbField);
    procedure SetIdendcomercial(const Value: TCmDbField);
    procedure SetIdendcorresp(const Value: TCmDbField);
    procedure SetIdendentrega(const Value: TCmDbField);
    procedure SetIdendresidencial(const Value: TCmDbField);
    procedure SetIdgrupo(const Value: TCmDbField);
    procedure SetIdimagem(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);
    procedure SetNumdocumento(const Value: TCmDbField);
    procedure SetRazaosocial(const Value: TCmDbField);
    procedure SetSeqtransmissao(const Value: TCmDbField);
    procedure SetTipo(const Value: TCmDbField);

  public

     Property Tipo: TCmDbField read FTipo write SetTipo;
     Property Seqtransmissao: TCmDbField read FSeqtransmissao write SetSeqtransmissao;
     Property Razaosocial: TCmDbField read FRazaosocial write SetRazaosocial;
     Property Numdocumento: TCmDbField read FNumdocumento write SetNumdocumento;
     Property Nome: TCmDbField read FNome write SetNome;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idimagem: TCmDbField read FIdimagem write SetIdimagem;
     Property Idgrupo: TCmDbField read FIdgrupo write SetIdgrupo;
     Property Idendresidencial: TCmDbField read FIdendresidencial write SetIdendresidencial;
     Property Idendentrega: TCmDbField read FIdendentrega write SetIdendentrega;
     Property Idendcorresp: TCmDbField read FIdendcorresp write SetIdendcorresp;
     Property Idendcomercial: TCmDbField read FIdendcomercial write SetIdendcomercial;
     Property Idendcobranca: TCmDbField read FIdendcobranca write SetIdendcobranca;
     Property Homepage: TCmDbField read FHomepage write SetHomepage;
     Property Flgvendedor: TCmDbField read FFlgvendedor write SetFlgvendedor;
     Property Flgusuario: TCmDbField read FFlgusuario write SetFlgusuario;
     Property Flgterceiro: TCmDbField read FFlgterceiro write SetFlgterceiro;
     Property Flgsindicato: TCmDbField read FFlgsindicato write SetFlgsindicato;
     Property Flgresponsavel: TCmDbField read FFlgresponsavel write SetFlgresponsavel;
     Property Flgrepresentante: TCmDbField read FFlgrepresentante write SetFlgrepresentante;
     Property Flgproprietariouh: TCmDbField read FFlgproprietariouh write SetFlgproprietariouh;
     Property Flgprodutor: TCmDbField read FFlgprodutor write SetFlgprodutor;
     Property Flgpatrocinadora: TCmDbField read FFlgpatrocinadora write SetFlgpatrocinadora;
     Property Flgpagador: TCmDbField read FFlgpagador write SetFlgpagador;
     Property Flgoutro: TCmDbField read FFlgoutro write SetFlgoutro;
     Property Flgoperadormanut: TCmDbField read FFlgoperadormanut write SetFlgoperadormanut;
     Property Flglocatario: TCmDbField read FFlglocatario write SetFlglocatario;
     Property Flginvalido: TCmDbField read FFlginvalido write SetFlginvalido;
     Property Flginstfin: TCmDbField read FFlginstfin write SetFlginstfin;
     Property Flghotel: TCmDbField read FFlghotel write SetFlghotel;
     Property Flghospede: TCmDbField read FFlghospede write SetFlghospede;
     Property Flggestorfundo: TCmDbField read FFlggestorfundo write SetFlggestorfundo;
     Property Flggestorcarteira: TCmDbField read FFlggestorcarteira write SetFlggestorcarteira;
     Property Flgfundacao: TCmDbField read FFlgfundacao write SetFlgfundacao;
     Property Flgfuncionario: TCmDbField read FFlgfuncionario write SetFlgfuncionario;
     Property Flgfornserv: TCmDbField read FFlgfornserv write SetFlgfornserv;
     Property Flgfilialpessoa: TCmDbField read FFlgfilialpessoa write SetFlgfilialpessoa;
     Property Flgestrangeiro: TCmDbField read FFlgestrangeiro write SetFlgestrangeiro;
     Property Flgemissor: TCmDbField read FFlgemissor write SetFlgemissor;
     Property Flgelegivel: TCmDbField read FFlgelegivel write SetFlgelegivel;
     Property Flgdependente: TCmDbField read FFlgdependente write SetFlgdependente;
     Property Flgcustodiante: TCmDbField read FFlgcustodiante write SetFlgcustodiante;
     Property Flgcotista: TCmDbField read FFlgcotista write SetFlgcotista;
     Property Flgcorretoravalor: TCmDbField read FFlgcorretoravalor write SetFlgcorretoravalor;
     Property Flgcontato: TCmDbField read FFlgcontato write SetFlgcontato;
     Property Flgconcierge: TCmDbField read FFlgconcierge write SetFlgconcierge;
     Property Flgcliente: TCmDbField read FFlgcliente write SetFlgcliente;
     Property Flgcandidato: TCmDbField read FFlgcandidato write SetFlgcandidato;
     Property Flgbolsavalores: TCmDbField read FFlgbolsavalores write SetFlgbolsavalores;
     Property Flgbolsa: TCmDbField read FFlgbolsa write SetFlgbolsa;
     Property Flgbenefprocuh: TCmDbField read FFlgbenefprocuh write SetFlgbenefprocuh;
     Property Flgbanco: TCmDbField read FFlgbanco write SetFlgbanco;
     Property Flgaverbadora: TCmDbField read FFlgaverbadora write SetFlgaverbadora;
     Property Flgavalista: TCmDbField read FFlgavalista write SetFlgavalista;
     Property Flgautarquia: TCmDbField read FFlgautarquia write SetFlgautarquia;
     Property Flgagenciaviagem: TCmDbField read FFlgagenciaviagem write SetFlgagenciaviagem;
     Property Flgagencia: TCmDbField read FFlgagencia write SetFlgagencia;
     Property Flgadministradora: TCmDbField read FFlgadministradora write SetFlgadministradora;
     Property Flgadminimovel: TCmDbField read FFlgadminimovel write SetFlgadminimovel;
     Property Flgadminfundo: TCmDbField read FFlgadminfundo write SetFlgadminfundo;
     Property Email: TCmDbField read FEmail write SetEmail;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDb_Pessoa }

constructor TDb_Pessoa.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PESSOA';

   fTipo := CreateCmDbField('TIPO',ftString,False,False,False,True,'');
   fSeqtransmissao := CreateCmDbField('SEQTRANSMISSAO',ftfloat,False,False,False,True,'');
   fRazaosocial := CreateCmDbField('RAZAOSOCIAL',ftString,False,False,False,True,'');
   fNumdocumento := CreateCmDbField('NUMDOCUMENTO',ftString,False,False,False,True,'');
   fNome := CreateCmDbField('NOME',ftString,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdimagem := CreateCmDbField('IDIMAGEM',ftfloat,False,False,False,True,'');
   fIdgrupo := CreateCmDbField('IDGRUPO',ftfloat,False,False,False,True,'');
   fIdendresidencial := CreateCmDbField('IDENDRESIDENCIAL',ftfloat,False,False,False,True,'');
   fIdendentrega := CreateCmDbField('IDENDENTREGA',ftfloat,False,False,False,True,'');
   fIdendcorresp := CreateCmDbField('IDENDCORRESP',ftfloat,False,False,False,True,'');
   fIdendcomercial := CreateCmDbField('IDENDCOMERCIAL',ftfloat,False,False,False,True,'');
   fIdendcobranca := CreateCmDbField('IDENDCOBRANCA',ftfloat,False,False,False,True,'');
   fHomepage := CreateCmDbField('HOMEPAGE',ftString,False,False,False,True,'');
   fFlgvendedor := CreateCmDbField('FLGVENDEDOR',ftfloat,False,False,False,True,'');
   fFlgusuario := CreateCmDbField('FLGUSUARIO',ftfloat,False,False,False,True,'');
   fFlgterceiro := CreateCmDbField('FLGTERCEIRO',ftfloat,False,False,False,True,'');
   fFlgsindicato := CreateCmDbField('FLGSINDICATO',ftfloat,False,False,False,True,'');
   fFlgresponsavel := CreateCmDbField('FLGRESPONSAVEL',ftfloat,False,False,False,True,'');
   fFlgrepresentante := CreateCmDbField('FLGREPRESENTANTE',ftfloat,False,False,False,True,'');
   fFlgproprietariouh := CreateCmDbField('FLGPROPRIETARIOUH',ftfloat,False,False,False,True,'');
   fFlgprodutor := CreateCmDbField('FLGPRODUTOR',ftfloat,False,False,False,True,'');
   fFlgpatrocinadora := CreateCmDbField('FLGPATROCINADORA',ftfloat,False,False,False,True,'');
   fFlgpagador := CreateCmDbField('FLGPAGADOR',ftfloat,False,False,False,True,'');
   fFlgoutro := CreateCmDbField('FLGOUTRO',ftfloat,False,False,False,True,'');
   fFlgoperadormanut := CreateCmDbField('FLGOPERADORMANUT',ftfloat,False,False,False,True,'');
   fFlglocatario := CreateCmDbField('FLGLOCATARIO',ftfloat,False,False,False,True,'');
   fFlginvalido := CreateCmDbField('FLGINVALIDO',ftfloat,False,False,False,True,'');
   fFlginstfin := CreateCmDbField('FLGINSTFIN',ftfloat,False,False,False,True,'');
   fFlghotel := CreateCmDbField('FLGHOTEL',ftfloat,False,False,False,True,'');
   fFlghospede := CreateCmDbField('FLGHOSPEDE',ftfloat,False,False,False,True,'');
   fFlggestorfundo := CreateCmDbField('FLGGESTORFUNDO',ftfloat,False,False,False,True,'');
   fFlggestorcarteira := CreateCmDbField('FLGGESTORCARTEIRA',ftfloat,False,False,False,True,'');
   fFlgfundacao := CreateCmDbField('FLGFUNDACAO',ftfloat,False,False,False,True,'');
   fFlgfuncionario := CreateCmDbField('FLGFUNCIONARIO',ftfloat,False,False,False,True,'');
   fFlgfornserv := CreateCmDbField('FLGFORNSERV',ftfloat,False,False,False,True,'');
   fFlgfilialpessoa := CreateCmDbField('FLGFILIALPESSOA',ftfloat,False,False,False,True,'');
   fFlgestrangeiro := CreateCmDbField('FLGESTRANGEIRO',ftfloat,False,False,False,True,'');
   fFlgemissor := CreateCmDbField('FLGEMISSOR',ftfloat,False,False,False,True,'');
   fFlgelegivel := CreateCmDbField('FLGELEGIVEL',ftfloat,False,False,False,True,'');
   fFlgdependente := CreateCmDbField('FLGDEPENDENTE',ftfloat,False,False,False,True,'');
   fFlgcustodiante := CreateCmDbField('FLGCUSTODIANTE',ftfloat,False,False,False,True,'');
   fFlgcotista := CreateCmDbField('FLGCOTISTA',ftfloat,False,False,False,True,'');
   fFlgcorretoravalor := CreateCmDbField('FLGCORRETORAVALOR',ftfloat,False,False,False,True,'');
   fFlgcontato := CreateCmDbField('FLGCONTATO',ftfloat,False,False,False,True,'');
   fFlgconcierge := CreateCmDbField('FLGCONCIERGE',ftfloat,False,False,False,True,'');
   fFlgcliente := CreateCmDbField('FLGCLIENTE',ftfloat,False,False,False,True,'');
   fFlgcandidato := CreateCmDbField('FLGCANDIDATO',ftfloat,False,False,False,True,'');
   fFlgbolsavalores := CreateCmDbField('FLGBOLSAVALORES',ftfloat,False,False,False,True,'');
   fFlgbolsa := CreateCmDbField('FLGBOLSA',ftfloat,False,False,False,True,'');
   fFlgbenefprocuh := CreateCmDbField('FLGBENEFPROCUH',ftfloat,False,False,False,True,'');
   fFlgbanco := CreateCmDbField('FLGBANCO',ftfloat,False,False,False,True,'');
   fFlgaverbadora := CreateCmDbField('FLGAVERBADORA',ftfloat,False,False,False,True,'');
   fFlgavalista := CreateCmDbField('FLGAVALISTA',ftfloat,False,False,False,True,'');
   fFlgautarquia := CreateCmDbField('FLGAUTARQUIA',ftfloat,False,False,False,True,'');
   fFlgagenciaviagem := CreateCmDbField('FLGAGENCIAVIAGEM',ftfloat,False,False,False,True,'');
   fFlgagencia := CreateCmDbField('FLGAGENCIA',ftfloat,False,False,False,True,'');
   fFlgadministradora := CreateCmDbField('FLGADMINISTRADORA',ftfloat,False,False,False,True,'');
   fFlgadminimovel := CreateCmDbField('FLGADMINIMOVEL',ftfloat,False,False,False,True,'');
   fFlgadminfundo := CreateCmDbField('FLGADMINFUNDO',ftfloat,False,False,False,True,'');
   fEmail := CreateCmDbField('EMAIL',ftString,False,False,False,True,'');
end;

function TDb_Pessoa.Insert: Boolean;
begin

   fIdpessoa.AsFloat := GetSequence('PESSOA');
   Result := Inherited Insert;

end;


procedure TDb_Pessoa.SetEmail(const Value: TCmDbField);
begin
  FEmail := Value;
end;

procedure TDb_Pessoa.SetFlgadminfundo(const Value: TCmDbField);
begin
  FFlgadminfundo := Value;
end;

procedure TDb_Pessoa.SetFlgadminimovel(const Value: TCmDbField);
begin
  FFlgadminimovel := Value;
end;

procedure TDb_Pessoa.SetFlgadministradora(const Value: TCmDbField);
begin
  FFlgadministradora := Value;
end;

procedure TDb_Pessoa.SetFlgagencia(const Value: TCmDbField);
begin
  FFlgagencia := Value;
end;

procedure TDb_Pessoa.SetFlgagenciaviagem(const Value: TCmDbField);
begin
  FFlgagenciaviagem := Value;
end;

procedure TDb_Pessoa.SetFlgautarquia(const Value: TCmDbField);
begin
  FFlgautarquia := Value;
end;

procedure TDb_Pessoa.SetFlgavalista(const Value: TCmDbField);
begin
  FFlgavalista := Value;
end;

procedure TDb_Pessoa.SetFlgaverbadora(const Value: TCmDbField);
begin
  FFlgaverbadora := Value;
end;

procedure TDb_Pessoa.SetFlgbanco(const Value: TCmDbField);
begin
  FFlgbanco := Value;
end;

procedure TDb_Pessoa.SetFlgbenefprocuh(const Value: TCmDbField);
begin
  FFlgbenefprocuh := Value;
end;

procedure TDb_Pessoa.SetFlgbolsa(const Value: TCmDbField);
begin
  FFlgbolsa := Value;
end;

procedure TDb_Pessoa.SetFlgbolsavalores(const Value: TCmDbField);
begin
  FFlgbolsavalores := Value;
end;

procedure TDb_Pessoa.SetFlgcandidato(const Value: TCmDbField);
begin
  FFlgcandidato := Value;
end;

procedure TDb_Pessoa.SetFlgcliente(const Value: TCmDbField);
begin
  FFlgcliente := Value;
end;

procedure TDb_Pessoa.SetFlgconcierge(const Value: TCmDbField);
begin
  FFlgconcierge := Value;
end;

procedure TDb_Pessoa.SetFlgcontato(const Value: TCmDbField);
begin
  FFlgcontato := Value;
end;

procedure TDb_Pessoa.SetFlgcorretoravalor(const Value: TCmDbField);
begin
  FFlgcorretoravalor := Value;
end;

procedure TDb_Pessoa.SetFlgcotista(const Value: TCmDbField);
begin
  FFlgcotista := Value;
end;

procedure TDb_Pessoa.SetFlgcustodiante(const Value: TCmDbField);
begin
  FFlgcustodiante := Value;
end;

procedure TDb_Pessoa.SetFlgdependente(const Value: TCmDbField);
begin
  FFlgdependente := Value;
end;

procedure TDb_Pessoa.SetFlgelegivel(const Value: TCmDbField);
begin
  FFlgelegivel := Value;
end;

procedure TDb_Pessoa.SetFlgemissor(const Value: TCmDbField);
begin
  FFlgemissor := Value;
end;

procedure TDb_Pessoa.SetFlgestrangeiro(const Value: TCmDbField);
begin
  FFlgestrangeiro := Value;
end;

procedure TDb_Pessoa.SetFlgfilialpessoa(const Value: TCmDbField);
begin
  FFlgfilialpessoa := Value;
end;

procedure TDb_Pessoa.SetFlgfornserv(const Value: TCmDbField);
begin
  FFlgfornserv := Value;
end;

procedure TDb_Pessoa.SetFlgfuncionario(const Value: TCmDbField);
begin
  FFlgfuncionario := Value;
end;

procedure TDb_Pessoa.SetFlgfundacao(const Value: TCmDbField);
begin
  FFlgfundacao := Value;
end;

procedure TDb_Pessoa.SetFlggestorcarteira(const Value: TCmDbField);
begin
  FFlggestorcarteira := Value;
end;

procedure TDb_Pessoa.SetFlggestorfundo(const Value: TCmDbField);
begin
  FFlggestorfundo := Value;
end;

procedure TDb_Pessoa.SetFlghospede(const Value: TCmDbField);
begin
  FFlghospede := Value;
end;

procedure TDb_Pessoa.SetFlghotel(const Value: TCmDbField);
begin
  FFlghotel := Value;
end;

procedure TDb_Pessoa.SetFlginstfin(const Value: TCmDbField);
begin
  FFlginstfin := Value;
end;

procedure TDb_Pessoa.SetFlginvalido(const Value: TCmDbField);
begin
  FFlginvalido := Value;
end;

procedure TDb_Pessoa.SetFlglocatario(const Value: TCmDbField);
begin
  FFlglocatario := Value;
end;

procedure TDb_Pessoa.SetFlgoperadormanut(const Value: TCmDbField);
begin
  FFlgoperadormanut := Value;
end;

procedure TDb_Pessoa.SetFlgoutro(const Value: TCmDbField);
begin
  FFlgoutro := Value;
end;

procedure TDb_Pessoa.SetFlgpagador(const Value: TCmDbField);
begin
  FFlgpagador := Value;
end;

procedure TDb_Pessoa.SetFlgpatrocinadora(const Value: TCmDbField);
begin
  FFlgpatrocinadora := Value;
end;

procedure TDb_Pessoa.SetFlgprodutor(const Value: TCmDbField);
begin
  FFlgprodutor := Value;
end;

procedure TDb_Pessoa.SetFlgproprietariouh(const Value: TCmDbField);
begin
  FFlgproprietariouh := Value;
end;

procedure TDb_Pessoa.SetFlgrepresentante(const Value: TCmDbField);
begin
  FFlgrepresentante := Value;
end;

procedure TDb_Pessoa.SetFlgresponsavel(const Value: TCmDbField);
begin
  FFlgresponsavel := Value;
end;

procedure TDb_Pessoa.SetFlgsindicato(const Value: TCmDbField);
begin
  FFlgsindicato := Value;
end;

procedure TDb_Pessoa.SetFlgterceiro(const Value: TCmDbField);
begin
  FFlgterceiro := Value;
end;

procedure TDb_Pessoa.SetFlgusuario(const Value: TCmDbField);
begin
  FFlgusuario := Value;
end;

procedure TDb_Pessoa.SetFlgvendedor(const Value: TCmDbField);
begin
  FFlgvendedor := Value;
end;

procedure TDb_Pessoa.SetHomepage(const Value: TCmDbField);
begin
  FHomepage := Value;
end;

procedure TDb_Pessoa.SetIdendcobranca(const Value: TCmDbField);
begin
  FIdendcobranca := Value;
end;

procedure TDb_Pessoa.SetIdendcomercial(const Value: TCmDbField);
begin
  FIdendcomercial := Value;
end;

procedure TDb_Pessoa.SetIdendcorresp(const Value: TCmDbField);
begin
  FIdendcorresp := Value;
end;

procedure TDb_Pessoa.SetIdendentrega(const Value: TCmDbField);
begin
  FIdendentrega := Value;
end;

procedure TDb_Pessoa.SetIdendresidencial(const Value: TCmDbField);
begin
  FIdendresidencial := Value;
end;

procedure TDb_Pessoa.SetIdgrupo(const Value: TCmDbField);
begin
  FIdgrupo := Value;
end;

procedure TDb_Pessoa.SetIdimagem(const Value: TCmDbField);
begin
  FIdimagem := Value;
end;

procedure TDb_Pessoa.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDb_Pessoa.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

procedure TDb_Pessoa.SetNumdocumento(const Value: TCmDbField);
begin
  FNumdocumento := Value;
end;

procedure TDb_Pessoa.SetRazaosocial(const Value: TCmDbField);
begin
  FRazaosocial := Value;
end;

procedure TDb_Pessoa.SetSeqtransmissao(const Value: TCmDbField);
begin
  FSeqtransmissao := Value;
end;

procedure TDb_Pessoa.SetTipo(const Value: TCmDbField);
begin
  FTipo := Value;
end;

end.



