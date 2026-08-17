unit fInvRegNaoEncontrados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwquery, MontaSelect, StdCtrls, TREdit,
  wwdbdatetimepicker, CMDateTimePicker, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Mask,
  wwdbedit, Wwdatsrc;

type
  TfrmInvRegNaoEncontrados = class(TfrmOkCancelar)
    pnlMestre: TPanel;
    Label6: TLabel;
    dbeSelLocal: TwwDBEdit;
    bbtnSelLocal: TBitBtn;
    Label8: TLabel;
    dbeConjunto: TwwDBEdit;
    bbtnSelConjunto: TBitBtn;
    bbtnGeraConjunto: TBitBtn;
    MSLocal: TMontaSelect;
    MSConjunto: TMontaSelect;
    qryBuscaConj: TwwQuery;
    qryBuscaConjIDCONJUNTO: TFloatField;
    qrySelConjunto: TwwQuery;
    qrySelConjuntoDESCCONJUNTO: TStringField;
    qrySelConjuntoIDCONJUNTO: TFloatField;
    qrySelConjuntoIDLOCALIZACAO: TFloatField;
    qrySelConjuntoIDRESPONSAVEL: TFloatField;
    qrySelConjuntoDESCLOCALIZACAO: TStringField;
    qrySelConjuntoDESCRESPONSAVEL: TStringField;
    qrySelConjuntoIDPESSOA: TFloatField;
    qrySelConjuntoDISPONIVEL: TFloatField;
    qrySelConjuntoALUGADO: TFloatField;
    qryLocal: TwwQuery;
    qryLocalIDLOCALIZACAO: TFloatField;
    qryLocalDESCLOCALIZACAO: TStringField;
    qryLocalIDRESPONSAVEL: TFloatField;
    qryLocalNOMERESPONSAVEL: TStringField;
    qryLocalIDEMPRESA: TFloatField;
    qryLocalCODCENTROCUSTO: TStringField;
    qryLocalIDPESSOA: TFloatField;
    dsLocal: TwwDataSource;
    dsSelConjunto: TwwDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelLocalClick(Sender: TObject);
    procedure bbtnSelConjuntoClick(Sender: TObject);
    procedure bbtnGeraConjuntoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iPessoa, iLocal, iConjunto : Integer;
  end;

var
  frmInvRegNaoEncontrados: TfrmInvRegNaoEncontrados;

implementation

{$R *.DFM}

uses uMensErro, uSistema, FCadConjunto;

procedure TfrmInvRegNaoEncontrados.FormCreate(Sender: TObject);
begin
   inherited;
   qryBuscaConj.Prepare;
   qrySelConjunto.Prepare;
   qryLocal.Prepare;
   //-------------------------------------------------------------------------------------
   iPessoa   := -1;
   iLocal    := -1;
   iConjunto := -1;
end;
//========================================================================================
procedure TfrmInvRegNaoEncontrados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   if not qryLocal.IsEmpty       then iPessoa   := qryLocalIDPESSOA.AsInteger;
   if not qryLocal.IsEmpty       then iLocal    := qryLocalIDLOCALIZACAO.AsInteger;
   if not qrySelConjunto.IsEmpty then iConjunto := qrySelConjuntoIDCONJUNTO.AsInteger;
   qryBuscaConj.Close;
   qrySelConjunto.Close;
   qryLocal.Close;
   qryBuscaConj.UnPrepare;
   qrySelConjunto.UnPrepare;
   qryLocal.UnPrepare;
end;
//========================================================================================
procedure TfrmInvRegNaoEncontrados.bbtnSelLocalClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   MSLocal.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   qryLocal.Close;
   qryBuscaConj.Close;
   qrySelConjunto.Close;
   if MSLocal.RetornouValor then
   begin
      qryLocal.ParamByName('PIDLOCAL').AsInteger   := StrToInt(MSLocal.ValoresChave[0]);
      qryLocal.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
      qryLocal.Open;
      //----------------------------------------------------------------------------------
      qryBuscaConj.ParamByName('PIDLOCAL').AsInteger   := StrToInt(MSLocal.ValoresChave[0]);
      qryBuscaConj.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
      qryBuscaConj.Open;
      if (qryBuscaConj.RecordCount = 1) then
      begin
         qrySelConjunto.ParamByName('PIDCONJUNTO').AsInteger := qryBuscaConjIDCONJUNTO.AsInteger;
         qrySelConjunto.Open;
      end;
   end;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmInvRegNaoEncontrados.bbtnSelConjuntoClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   if not qryLocalIDLOCALIZACAO.IsNull then
      MSConjunto.Filtro.Strings[2] := 'CONJUNTO.IDLOCALIZACAO = ' + qryLocalIDLOCALIZACAO.AsString;
   MSConjunto.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   qrySelConjunto.Close;
   if MSConjunto.RetornouValor then
   begin
      qrySelConjunto.ParamByName('PIDCONJUNTO').AsInteger := StrToInt(MSConjunto.ValoresChave[0]);
      qrySelConjunto.Open;
      //----------------------------------------------------------------------------------
      bbtnConfirmar.SetFocus;
   end;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmInvRegNaoEncontrados.bbtnGeraConjuntoClick(Sender: TObject);
begin
   inherited;
   Application.CreateForm(TfrmCadConjunto,frmCadConjunto);
   frmCadConjunto.FormStyle := FsNormal;
   frmCadConjunto.Visible   := False;
   frmCadConjunto.Top       := 76;
   frmCadConjunto.ShowModal;
   //-------------------------------------------------------------------------------------
   qrySelConjunto.Close;
   if not frmCadConjunto.qryUltConj.Fieldbyname('IDCONJUNTO').IsNull then
   begin
      qrySelConjunto.ParamByName('PIDCONJUNTO').AsInteger := frmCadConjunto.qryUltConj.Fieldbyname('IDCONJUNTO').asInteger;
      qrySelConjunto.Open;
   end;   
   //-------------------------------------------------------------------------------------
   frmCadConjunto.qryUltConj.Close;
   frmCadConjunto.qryUltConj.UnPrepare;
   frmCadConjunto.Release;
end;
//========================================================================================

end.
