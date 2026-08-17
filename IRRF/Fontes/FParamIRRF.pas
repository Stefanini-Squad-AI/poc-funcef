unit FParamIRRF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, wwdblook, ComCtrls, TREdit,
  TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, CMProcuraSubTipo,
  CmEventosCadastro, ImgList, DBCtrls;

type
  TfrmParamIRRF = class(TfrmCadastroCS)
    pcnParametros: TPageControl;
    tbsGeral: TTabSheet;
    grpAlteradorCAR: TGroupBox;
    lblJuros: TLabel;
    lblIRRFCAR: TLabel;
    dblcComissao: TwwDBLookupCombo;
    dblcIRRFCAR: TwwDBLookupCombo;
    qryAlterador1: TwwQuery;
    qryAlterador: TwwQuery;
    grpAlteradorCAP: TGroupBox;
    lblINSS: TLabel;
    lblIRRFCAP: TLabel;
    dblcINSS: TwwDBLookupCombo;
    dblcIRRFCAP: TwwDBLookupCombo;
    qryAlterador2: TwwQuery;
    tbsPessoaFisica: TTabSheet;
    dbIdosos: TGroupBox;
    DBRealEdit1: TDBRealEdit;
    gbValorIdoso: TGroupBox;
    dbrVlrIdosos: TDBRealEdit;
    gbDependentes: TGroupBox;
    dbrDependente: TDBRealEdit;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    Label3: TLabel;
    wwDBLookupCombo2: TwwDBLookupCombo;
    Label4: TLabel;
    wwDBLookupCombo3: TwwDBLookupCombo;
    Label5: TLabel;
    wwDBLookupCombo4: TwwDBLookupCombo;
    qryDesembolso: TwwQuery;
    qryAtivProj: TwwQuery;
    qryCentroRespon: TwwQuery;
    qryTipDoc: TwwQuery;
    GroupBox1: TGroupBox;
    Multa: TLabel;
    Label7: TLabel;
    dblcmbMulta: TwwDBLookupCombo;
    dblcmbJuros: TwwDBLookupCombo;
    qryAlterador3: TwwQuery;
    CMProcuraSubTipo1: TCMProcuraSubTipo;
    gbImpExterior: TGroupBox;
    dbreImpExterior: TDBRealEdit;
    lblPer: TLabel;
    dbrgPagLanc: TDBRadioGroup;
    procedure FormActivate(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamIRRF: TfrmParamIRRF;

implementation

Uses USistema, UMensErro, UDatabase, DBaseDados,UAutorizacao;

{$R *.DFM}

procedure TfrmParamIRRF.FormActivate(Sender: TObject);
begin
  inherited;
  tbsGeral.Enabled:=False;
  tbsPessoaFisica.Enabled:=False;
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.text := 'SELECT * FROM '+Sistema.PrefixoServidor+'PARAMIRRF WHERE IDPESSOA = '+ IntToStr(Sistema.IdEmpresa);
  qry.Open;
  //
  qryAlterador.Close;
  qryAlterador.SQL.Clear;
  qryAlterador.SQL.text := 'SELECT CODALTERADOR,DESCRICAO FROM '+Sistema.PrefixoServidor+'TIPOALTERADOR WHERE RECPAG = ''R'' AND ACRESDECRES = ''C'' AND IDPESSOA = '+ IntToStr(Sistema.idEmpresa)+' ORDER BY DESCRICAO';
  qryAlterador.Open;
  //
  qryAlterador1.Close;
  qryAlterador1.SQL.Clear;
  qryAlterador1.SQL.text := 'SELECT CODALTERADOR,DESCRICAO FROM '+Sistema.PrefixoServidor+'TIPOALTERADOR WHERE RECPAG = ''R'' AND ACRESDECRES = ''D'' AND IDPESSOA = '+ IntToStr(Sistema.idEmpresa)+' ORDER BY DESCRICAO';
  qryAlterador1.Open;
  //
  qryAlterador2.Close;
  qryAlterador2.SQL.Clear;
  qryAlterador2.SQL.text := 'SELECT CODALTERADOR,DESCRICAO FROM '+Sistema.PrefixoServidor+'TIPOALTERADOR WHERE RECPAG = ''P'' AND ACRESDECRES = ''D'' AND IDPESSOA = '+ IntToStr(Sistema.idEmpresa)+' ORDER BY DESCRICAO';
  qryAlterador2.Open;
  //
  //
  qryDesembolso.close;
  qryDesembolso.PARAMBYNAME('IDPESSOA').ASinteger := sistema.idempresa;
  qryDesembolso.open;
  //
  qryAtivProj.close;
  qryAtivProj.PARAMBYNAME('IDPESSOA').ASinteger := sistema.idempresa;
  qryAtivProj.open;
  //
  qryCentroRespon.close;
  qryCentroRespon.PARAMBYNAME('IDPESSOA').ASinteger := sistema.idempresa;
  qryCentroRespon.open;
  //
  qryTipDoc.open;
  //
  qryAlterador3.close;
  qryAlterador3.PARAMBYNAME('IDPESSOA').ASinteger := sistema.idempresa;
  qryAlterador3.open;


end;

procedure TfrmParamIRRF.CmeCadastroEdit(Sender: TObject);
begin
  tbsGeral.Enabled:=True;
  tbsPessoaFisica.Enabled:=True;
  if (qry.Eof) then
  Begin
     ds.DataSet.Insert;
     qry.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  end;
  inherited;
  if qry.FieldByName('FLGPAGLANC').isNull then
     qry.FieldByName('FLGPAGLANC').AsString := 'P';
  pcnParametros.ActivePage:=tbsGeral;
  dblcComissao.SetFocus;
end;

procedure TfrmParamIRRF.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  sbtnInserir.Enabled:=False;
  sbtnApagar.Enabled:=False;
  sbtnProcurar.Enabled:=False;
  sbtnAlterar.Enabled:=True;
end;

procedure TfrmParamIRRF.bbtnConfirmarClick(Sender: TObject);
begin
  tbsGeral.Enabled:=False;
  tbsPessoaFisica.Enabled:=False;
  inherited;
end;

procedure TfrmParamIRRF.bbtnCancelarClick(Sender: TObject);
begin
  tbsGeral.Enabled:=False;
  tbsPessoaFisica.Enabled:=False;
  inherited;
end;


end.
