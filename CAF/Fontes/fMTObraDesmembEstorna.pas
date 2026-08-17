unit fMTObraDesmembEstorna;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, MontaSelect, Db,
  DBTables, Wwquery, wwdblook, wwdbdatetimepicker, CMDateTimePicker, Grids,
  fcLabel, Mask, wwdbedit, Wwdatsrc, DBCtrls, Wwdbigrd, Wwdbgrid, DBClient,
  uCMClientDataSet, uCmSqlParams,
  uCMTypes, uCtrlPadroes, uCtrlCafObra, IvEMulti;

type
  TfrmMTObraDesmembEstorna = class(TfrmOkCancelar)
    pnlMestre: TPanel;
    PnlDetalhe: TPanel;
    dsObraFilhos: TwwDataSource;
    dbgObrasFilho: TwwDBGrid;
    Label1: TLabel;
    dbeDtaInicioObra: TCMDateTimePicker;
    dbeDescObra: TDBMemo;
    Label7: TLabel;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    bbtnProcurar: TBitBtn;
    dsCafObra: TwwDataSource;
    lblEncerrado: TfcLabel;
    cdsCafObra: TCMClientDataSet;
    MSObra: TMontaSelect;
    cdsObraFilhos: TCMClientDataSet;
    sqlObraFilhos: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Obra : TCtrlCafObra;
    //------------------------------------------------------------------------------------
    procedure SelObra(fIdPessoa, fIdCafObra : Extended);
  public
    { Public declarations }
  end;

var
  frmMTObraDesmembEstorna: TfrmMTObraDesmembEstorna;

implementation

uses uSistema, uMensErro;

{$R *.DFM}

procedure TfrmMTObraDesmembEstorna.FormCreate(Sender: TObject);
begin
   inherited;
   Obra := TCtrlCafObra.Create;
   Obra.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   MSObra.Filtro.Add('CAFOBRA.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
end;
//========================================================================================
procedure TfrmMTObraDesmembEstorna.FormShow(Sender: TObject);
begin
   inherited;
   SelObra(Sistema.IdEmpresa, 0);
end;
//========================================================================================
procedure TfrmMTObraDesmembEstorna.SelObra(fIdPessoa, fIdCafObra : Extended);
Var
   iSoma : Integer;
begin
   cdsCafObra.Data := Obra.ListaCafObra(fIdPessoa, fIdCafObra);
   if not cdsCafObra.IsEmpty then
   begin
      lblEncerrado.Caption := 'Encerrado em ' + cdsCafObra.FieldByName('DTAENCERRAOBRA').AsString;
      //----------------------------------------------------------------------------------
      cdsObraFilhos.Close;
      sqlObraFilhos.Prepare;
      sqlObraFilhos.ParamByName('IDCAFOBRA').AsFloat := fIdCafObra;
      sqlObraFilhos.ParamByName('IDPESSOA').AsFloat  := fIdPessoa;
      sqlObraFilhos.Open;
      //----------------------------------------------------------------------------------
      cdsObraFilhos.DisableControls;
      iSoma := 0;
      while not cdsObraFilhos.EOF do
      begin
         iSoma := iSoma + cdsObraFilhos.FieldByName('QTDLANC').AsInteger;
         cdsObraFilhos.Next;
      end;
      cdsObraFilhos.First;
      cdsObraFilhos.EnableControls;
      //----------------------------------------------------------------------------------
      if iSoma <> 0 then
      begin
         MsgDlg('Já existem lançamentos nas Obras Geradas!', 'Informação', mtInformation, [mbOk], 0);
         bbtnConfirmar.Enabled := False;
      end else
         bbtnConfirmar.Enabled := True;
      //----------------------------------------------------------------------------------
      pnlDetalhe.Enabled := True;
   end else
   begin
      lblEncerrado.Caption := '';
      cdsObraFilhos.Close;
      sqlObraFilhos.Prepare;
      sqlObraFilhos.ParamByName('IDCAFOBRA').AsInteger := -1;
      sqlObraFilhos.ParamByName('IDPESSOA').AsInteger  := -1;
      sqlObraFilhos.Open;
      bbtnConfirmar.Enabled := False;
      pnlDetalhe.Enabled := False;
      bbtnProcurar.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMTObraDesmembEstorna.bbtnProcurarClick(Sender: TObject);
begin
   inherited;
   MSObra.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSObra.RetornouValor then
      SelObra(StrToFloat(MSObra.ValoresChave[1]), StrToFloat(MSObra.ValoresChave[0]));
end;
//========================================================================================
procedure TfrmMTObraDesmembEstorna.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   //-------------------------------------------------------------------------------------
   if Obra.EstornaDesmembraObra(cdsCafObra.FieldByName('IDMODULO').AsFloat,
                                cdsCafObra.FieldByName('IDPESSOA').AsFloat,
                                cdsCafObra.FieldByName('IDCAFOBRA').AsFloat) then
   begin
      MsgDlg('Movimentação Realizada!','Informação',mtInformation,[mbOk],0);
   end else
      MsgDlg('Movimentação não Realizada!' + #13 + #13 +
             'Causa : ' + Obra.MessageInfo,
             'Erro',mtError,[mbOk],0);
   //-------------------------------------------------------------------------------------
   SelObra(0, 0);
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmMTObraDesmembEstorna.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   SelObra(0, 0);
end;
//========================================================================================
procedure TfrmMTObraDesmembEstorna.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   cdsObraFilhos.Close;
   Obra.Free;
end;

end.

