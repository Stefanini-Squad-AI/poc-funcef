unit FMOVFIARIO3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, DBCtrls, usistema, Udatabase, umenserro;

type
  TFRMMOVFIARIO3 = class(TfrmCadastroCS)
    Label1: TLabel;
    Label2: TLabel;
    Assunto: TLabel;
    dbdataInclusao: TCMDateTimePicker;
    Label3: TLabel;
    MemoAssunto: TDBMemo;
    edparticipante: TEdit;
    qryassunto: TwwQuery;
    qryassuntoDESCRICAO: TStringField;
    qryassuntoIDFIARASS: TFloatField;
    DataSource1: TDataSource;
    dblkGrupo: TwwDBLookupCombo;
    MontaSelect1: TMontaSelect;
    qryIDTITULAR: TFloatField;
    qryIDPESSOA: TFloatField;
    qryIDMODULO: TFloatField;
    qryIDRUBS: TFloatField;
    qryDESCRICAO: TStringField;
    qryDATAINCLUSAO: TDateTimeField;
    qryIDGRUPO: TFloatField;
    qryIDFIARIOA: TFloatField;
    qryIDUSUARIO: TFloatField;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMMOVFIARIO3: TFRMMOVFIARIO3;

implementation

{$R *.DFM}

procedure TFRMMOVFIARIO3.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
    edparticipante.text := MontaSelect.ValoresChave[3];
    dbdataInclusao.Text := MontaSelect.ValoresChave[14];

    qryassunto.Locate('IDFIARASS',strToFloat(MontaSelect.ValoresChave[15]),[loCaseInsensitive, loPartialKey]);
    dblkGrupo.Text := MontaSelect.ValoresChave[16];
    dblkGrupo.refresh;

    qry.close;
    qry.ParamByName('IdTitular').asFloat := strToFloat(MontaSelect.ValoresChave[1]);
    qry.ParamByName('IdPessoa').asFloat := strToFloat(MontaSelect.ValoresChave[2]);
    qry.ParamByName('IdGrupo').asFloat  := strToFloat(MontaSelect.ValoresChave[15]);
    qry.ParamByName('DataInclusao').asDate := strToDate(MontaSelect.ValoresChave[14]);
    qry.Open;

  end;
end;

procedure TFRMMOVFIARIO3.FormCreate(Sender: TObject);
begin
  inherited;
  QryAssunto.Open;
  qry.open;
end;

procedure TFRMMOVFIARIO3.CmeCadastroConfirma(Sender: TObject);
var inseriu : boolean;
begin
  if QRY.State = dsInsert then
  begin
    inseriu := false;
    qryIdFiarioa.asFloat := leUltRegistro(nil,'Fiario');
    edparticipante.text    := MontaSelect1.ValoresChave[3];
    qryIdTitular.asFloat   := strToFloat(MontaSelect1.ValoresChave[1]);
    qryIdPessoa.asFloat    := strToFloat(MontaSelect1.ValoresChave[2]);
    qryIdGrupo.asFloat     := qryassuntoIDFIARASS.asFloat;
    qryIdUsuario.asFloat   := sistema.idusuario;
    qryIdmodulo.asFloat    := 19;
    qryIdrubs.CLEAR;
    qryDescricao.asString  :=  memoAssunto.text;
    inseriu := true;
  end;

  inherited;
  //limpa a tela
  if not inseriu then
  begin
    edparticipante.Text := '';
    qry.close;
    qry.ParamByName('IdTitular').asFloat := -1;
    qry.ParamByName('IdPessoa').asFloat := -1;
    qry.ParamByName('IdGrupo').asFloat  := strToFloat(MontaSelect.ValoresChave[15]);
    qry.ParamByName('DataInclusao').asDate := strToDate(MontaSelect.ValoresChave[14]);
    qry.Open;
  end;
end;

procedure TFRMMOVFIARIO3.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
   MontaSelect1.Executar;
   if not MontaSelect1.RetornouValor then
   begin
     bbtnCancelarClick(sender);
   end
   else
     edparticipante.text    := MontaSelect1.ValoresChave[3];
end;

procedure TFRMMOVFIARIO3.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  if dbdataInclusao.Text = '' then
  begin
     MsgDlg('Favor informar a Data de Incluão!','Atenção',mtError,[mbOk],0);
     If dbdataInclusao.CanFocus Then dbdataInclusao.SetFocus;
     abort;
  end;
  if dblkgrupo.Text = '' then
  begin
     MsgDlg('Favor informar o Grupo de Protocolo!','Atenção',mtError,[mbOk],0);
     If dblkgrupo.CanFocus Then dblkgrupo.SetFocus;
     abort;
  end;
  if MemoAssunto.Text = '' then
  begin
     MsgDlg('A Descrição do assunto não está preenchido!','Atenção',mtError,[mbOk],0);
     If MemoAssunto.CanFocus Then MemoAssunto.SetFocus;
     abort;
  end;
  campovazio := false;

  inherited;
end;

end.
