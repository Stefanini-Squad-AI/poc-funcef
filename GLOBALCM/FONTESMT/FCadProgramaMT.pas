{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
unit FCadProgramaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet, wwdbedit,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask,
  uCtrlPrograma
{$IFNDEF VERSAO0505}
  , uCmTypes, uCmSqlParams
{$ENDIF}
;

type
  TfrmCadPrograma = class(TFrmCadastroMT)
    Label1: TLabel;
    Label2: TLabel;
    DbEdCodigo: TwwDBEdit;
    DbEdDesc: TwwDBEdit;
    CMSqlParams1: TCMSqlParams;
    rdgTipo: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    Programa: TCtrlPrograma;
    Procedure Seleciona( IdPrograma: Double = 0 );
  public
    { Public declarations }
  end;

var
  frmCadPrograma: TfrmCadPrograma;

implementation

{$R *.DFM}

Uses uMensErro, dBasedados, uSistema, uMidasUtil;

procedure TfrmCadPrograma.Seleciona( IdPrograma: Double );
begin
  cds.Data := Programa.ListaPrograma( IdPrograma );
end;

procedure TfrmCadPrograma.FormCreate(Sender: TObject);
begin
  inherited;
  Programa := TCtrlPrograma.Create;
  Programa.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                       Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  Programa.cds := cds;
  Seleciona( -1 );
end;

procedure TfrmCadPrograma.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Programa.Free;
end;

procedure TfrmCadPrograma.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  IF MontaSelect.RetornouValor Then
  begin
     Seleciona( StrToFloat( MontaSelect.ValoresChave[ 0 ] ) );
     if cds.FieldByName('FLGTIPOPROGRAMA').AsString = 'PRE' then rdgTipo.ItemIndex := 0;
     if cds.FieldByName('FLGTIPOPROGRAMA').AsString = 'ASS' then rdgTipo.ItemIndex := 1;
     if cds.FieldByName('FLGTIPOPROGRAMA').AsString = 'INV' then rdgTipo.ItemIndex := 2;
     if cds.FieldByName('FLGTIPOPROGRAMA').AsString = 'ADM' then rdgTipo.ItemIndex := 3;
  end;
end;

procedure TfrmCadPrograma.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Programa.Gravar;
end;

procedure TfrmCadPrograma.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Programa.Gravar;
end;

procedure TfrmCadPrograma.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Programa.Gravar;
end;

procedure TfrmCadPrograma.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg( Programa.MessageInfo, 'Erro', mtError, [ mbOK ], 0 );
end;

procedure TfrmCadPrograma.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbedCodigo.SetFocus;
end;

procedure TfrmCadPrograma.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedCodigo.SetFocus;
end;

procedure TfrmCadPrograma.bbtnConfirmarClick(Sender: TObject);
var sTipo : string;
    bNaoExiste : Boolean;
begin
   if rdgTipo.ItemIndex = -1 then
   begin
      MsgDlg( 'Obrigatório informar o tipo de programa', 'Erro', mtError, [ mbOK ], 0 );
      Exit;
   end
   else
   begin
      case rdgTipo.ItemIndex of
         0 : sTipo := 'PRE';
         1 : sTipo := 'ASS';
         2 : sTipo := 'INV';
         3 : sTipo := 'ADM';
      end;
      bNaoExiste := not Programa.ExisteTipo(sTipo);
      if not bNaoExiste then
      begin
         MsgDlg('Já existe um programa com o tipo selecionado', 'Erro', mtError, [ mbOK ], 0 );
         Exit;
      end;
   end;

   if cds.State in dsEditModes then
      cds.FieldByName('FLGTIPOPROGRAMA').AsString := sTipo;

   inherited;

end;

procedure TfrmCadPrograma.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   if cds.FieldByName('FLGTIPOPROGRAMA').AsString = 'PRE' then rdgTipo.ItemIndex := 0;
   if cds.FieldByName('FLGTIPOPROGRAMA').AsString = 'ASS' then rdgTipo.ItemIndex := 1;
   if cds.FieldByName('FLGTIPOPROGRAMA').AsString = 'INV' then rdgTipo.ItemIndex := 2;
   if cds.FieldByName('FLGTIPOPROGRAMA').AsString = 'ADM' then rdgTipo.ItemIndex := 3;
end;

end.



