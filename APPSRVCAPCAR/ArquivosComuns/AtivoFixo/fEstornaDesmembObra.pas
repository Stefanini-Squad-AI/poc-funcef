unit fEstornaDesmembObra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, MontaSelect, Db,
  DBTables, Wwquery, wwdblook, wwdbdatetimepicker, CMDateTimePicker, Grids,
  fcLabel, Mask, wwdbedit, Wwdatsrc, DBCtrls, Wwdbigrd, Wwdbgrid;

type
  TfrmEstornaDesmembObra = class(TfrmOkCancelar)
    pnlMestre: TPanel;
    PnlDetalhe: TPanel;
    qryObraFilhos: TwwQuery;
    dsObraFilhos: TwwDataSource;
    dbgObrasFilho: TwwDBGrid;
    qryObra: TwwQuery;
    MSObra: TMontaSelect;
    Label1: TLabel;
    dbeDtaInicioObra: TCMDateTimePicker;
    dbeDescObra: TDBMemo;
    Label7: TLabel;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    bbtnProcurar: TBitBtn;
    dsObra: TwwDataSource;
    lblEncerrado: TfcLabel;
    qryVerObraLanc: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LimpaCampos;
  end;

var
  frmEstornaDesmembObra: TfrmEstornaDesmembObra;

implementation

uses uAutorizacao, uSistema, uAtivoFixo, dAtivoFixo, uMensErro;

{$R *.DFM}

procedure TfrmEstornaDesmembObra.FormCreate(Sender: TObject);
begin
   inherited;
   qryObra.Prepare;
   qryObraFilhos.Open;
end;
//========================================================================================
procedure TfrmEstornaDesmembObra.FormActivate(Sender: TObject);
begin
  inherited;
  LimpaCampos;
end;
//========================================================================================
procedure TfrmEstornaDesmembObra.LimpaCampos;
begin
   qryObraFilhos.Close;
   qryObraFilhos.Open;
   lblEncerrado.Caption := '';
   pnlDetalhe.Enabled := False;
end;
//========================================================================================
procedure TfrmEstornaDesmembObra.bbtnProcurarClick(Sender: TObject);
var
   iSoma : Integer;
   
begin
   inherited;
   LimpaCampos;
   MSObra.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSObra.RetornouValor then
   begin
      qryObra.Close;
      qryObra.ParamByName('IDPESSOA').AsInteger  := StrToInt(MSObra.ValoresChave[0]);
      qryObra.ParamByName('IDCAFOBRA').AsInteger := StrToInt(MSObra.ValoresChave[1]);
      qryObra.Open;
      if qryObra.IsEmpty then
      begin
         MsgDlg('Erro ao acessar o cadastro da obra', 'Erro', mtError, [mbOk], 0);
         LimpaCampos;
         bbtnProcurar.SetFocus;
      end else
      begin
         lblEncerrado.Caption := 'Encerrado em ' + qryObra.FieldByName('DTAENCERRAOBRA').AsString;
         //-------------------------------------------------------------------------------
         qryObraFilhos.Close;
         qryObraFilhos.ParamByName('IDPESSOA').AsInteger  := StrToInt(MSObra.ValoresChave[0]);
         qryObraFilhos.ParamByName('IDCAFOBRA').AsInteger := StrToInt(MSObra.ValoresChave[1]);
         qryObraFilhos.Open;
         //-------------------------------------------------------------------------------
         qryObraFilhos.DisableControls;
         iSoma := 0;
         while not qryObraFilhos.EOF do
         begin
            iSoma := iSoma + qryObraFilhos.FieldByName('QTDLANC').AsInteger;
            qryObraFilhos.Next;
         end;
         qryObraFilhos.First;
         qryObraFilhos.EnableControls;
         //-------------------------------------------------------------------------------
         if iSoma <> 0 then
         begin
            MsgDlg('Já existem lançamentos nas Obras Geradas!', 'Informação', mtInformation, [mbOk], 0);
            bbtnConfirmar.Enabled := False;
         end else
            bbtnConfirmar.Enabled := True;
         //-------------------------------------------------------------------------------
         pnlDetalhe.Enabled := True;
      end;
   end else
   begin
      LimpaCampos;
      bbtnProcurar.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmEstornaDesmembObra.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   //-------------------------------------------------------------------------------------
   if AtivoFixo.EstornaDesmembraObra(Sistema.IdModulo,
                                     qryObra.FieldByName('IDPESSOA').AsInteger,
                                     qryObra.FieldByName('IDCAFOBRA').AsInteger) then
   begin
      MsgDlg('Movimentação Realizada!','Informação',mtInformation,[mbOk],0);
      LimpaCampos;
      bbtnProcurar.SetFocus;
   end else
      MsgDlg('Movimentação não Realizada!' + #13 + #13 +
             'Causa : ' + AtivoFixo.MensagemErro,
             'Erro',mtError,[mbOk],0);
   //-------------------------------------------------------------------------------------
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmEstornaDesmembObra.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   LimpaCampos;
   bbtnProcurar.SetFocus;
end;
//========================================================================================
procedure TfrmEstornaDesmembObra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryObra.Close;
   qryObraFilhos.Close;
   //-------------------------------------------------------------------------------------
   qryObra.UnPrepare;
   qryObraFilhos.UnPrepare;
end;

end.

