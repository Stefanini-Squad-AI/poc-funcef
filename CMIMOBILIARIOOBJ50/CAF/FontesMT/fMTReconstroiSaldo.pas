unit fMTReconstroiSaldo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, wwdbdatetimepicker, CMDateTimePicker,
  DB, Wwdatsrc, DBClient, uCMClientDataSet, MontaSelect, uCmSqlParams,
  Gauges, IvEMulti, uCtrlReconstroiSaldo, uCtrlGrupoContab;

type
  TfrmMTReconstroiSaldo = class(TfrmOkCancelar)
    Label3: TLabel;
    dblcGrupo: TwwDBLookupCombo;
    cdsGrupo: TCMClientDataSet;
    dsGrupo: TwwDataSource;
    rdgTipoBem: TRadioGroup;
    rdgRemover: TRadioGroup;
    Label26: TLabel;
    edPlaca: TEdit;
    bbtnPlaca: TBitBtn;
    MSBem: TMontaSelect;
    pnlStatus: TPanel;
    lblStatus: TLabel;
    pnlprgBar: TPanel;
    prgBar: TGauge;
    Label1: TLabel;
    edDescricao: TMemo;
    sqlBem: TCMSqlParams;
    cdsBem: TCMClientDataSet;
    ckbLog: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnPlacaClick(Sender: TObject);
    procedure edPlacaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblcGrupoExit(Sender: TObject);
    procedure edPlacaEnter(Sender: TObject);
  private
    { Private declarations }
    iIdbem,
    iIdGrupo : Integer;
    //------------------------------------------------------------------------------------
    GrupoContab     : TCtrlGrupoContab;
    ReconstroiSaldo : TCtrlReconstroiSaldo;
    //------------------------------------------------------------------------------------
    procedure Progresso(vParam : Array of Variant);
  public
    { Public declarations }
  end;

var
  frmMTReconstroiSaldo: TfrmMTReconstroiSaldo;

implementation

{$R *.dfm}

uses uMensErro, uSistema, uCtrlPadroes ;

procedure TfrmMTReconstroiSaldo.Progresso(vParam : Array of Variant);
begin
   inherited;
   prgBar.MaxValue   := vParam[1];
   prgBar.Progress   := vParam[2];
   lblStatus.Caption := vParam[3];
   //-------------------------------------------------------------------------------------
   if (prgBar.Progress <= 1) or ((prgBar.Progress Mod 7) = 0) or (prgBar.Progress >= prgBar.MaxValue) then
      Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMTReconstroiSaldo.FormCreate(Sender: TObject);
begin
   inherited;
   ReconstroiSaldo := TCtrlReconstroiSaldo.Create;
   ReconstroiSaldo.InitializeAs(Padroes);
   ReconstroiSaldo.Progresso := Progresso;
   //-------------------------------------------------------------------------------------
   GrupoContab := tCtrlGrupoContab.Create;
   GrupoContab.InitializeAs(Padroes);
   cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa,-1,'A');
   //-------------------------------------------------------------------------------------
   MSBem.Filtro.Add('BEM.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
   //-------------------------------------------------------------------------------------
   iIdBem   := -1;
   iIdGrupo := -1;
end;
//========================================================================================
procedure TfrmMTReconstroiSaldo.bbtnPlacaClick(Sender: TObject);
begin
   inherited;
   MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSBem.RetornouValor then
   begin
      iIdBem           := StrToInt(MSBem.ValoresChave[1]);
      edPlaca.Text     := MSBem.ValoresChave[2];
      edDescricao.Text := MSBem.ValoresChave[3];
   end else
   begin
      iIdBem := -1;
      edPlaca.Text := '';
      edDescricao.Text := '';
   end;
end;
//========================================================================================
procedure TfrmMTReconstroiSaldo.edPlacaEnter(Sender: TObject);
begin
   inherited;
   if bbtnSair.Focused then Exit;
   //-------------------------------------------------------------------------------------
   iIdBem := -1;
   edPlaca.Text := '';
   edDescricao.Text := '';
end;
//========================================================================================
procedure TfrmMTReconstroiSaldo.edPlacaExit(Sender: TObject);
begin
   inherited;
   if bbtnSair.Focused then Exit;
   //-------------------------------------------------------------------------------------
   if edPlaca.Text <> '' then
   begin
      sqlBem.Prepare;
      sqlBem.ParamByName('PLACA').AsFloat    := strtofloat(edPlaca.Text);
      sqlBem.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
      sqlBem.Open;
      //----------------------------------------------------------------------------------
      iIdBem := cdsBem.FieldByName('IDBEM').AsInteger;
      edDescricao.Text := cdsBem.FieldByName('DESBEM').AsString;
      if iIdBem <= 0 then
         MsgDlg('Placa não Localizada','Erro', mtError, [mbOk], 0);
   end else
   begin
      iIdBem := -1;
      edDescricao.Text := '';
   end;
end;
//========================================================================================
procedure TfrmMTReconstroiSaldo.dblcGrupoExit(Sender: TObject);
begin
   inherited;
   if dblcGrupo.Text <> '' then
      iIdGrupo := cdsGrupo.FieldByName('IDGRUPO').AsInteger
   else
      iIdGrupo := -1;
end;
//========================================================================================
procedure TfrmMTReconstroiSaldo.bbtnConfirmarClick(Sender: TObject);
var
   sDataIni, sDataFim : String;

begin
   inherited;
   pnlStatus.Visible     := True;
   bbtnConfirmar.Enabled := False;
   bbtnSair.Enabled      := False;
   //-------------------------------------------------------------------------------------
   sDataIni := DateTimeToStr(Now);
   //-------------------------------------------------------------------------------------
   ReconstroiSaldo.CreateThreadProgresso;
   try
      if not ReconstroiSaldo.AcionarII(Sistema.IdEmpresa,
                                     rdgTipoBem.ItemIndex, rdgRemover.ItemIndex,
                                     iIdBem, iIdGrupo, ReconstroiSaldo.ProgressFileName) then
      begin
         sDataFim := DateTimeToStr(Now);
         MsgDlg('Reconstrução não Realizada!' + #13 + #13 +
                'Causa : ' + ReconstroiSaldo.MessageInfo + #13 + #13 +
                'Inicio : ' + sDataIni + ' Termino : ' + sDataFim,
                'Erro', mtError, [mbOk], 0);
         pnlStatus.Visible := False;
      end else
      begin
         pnlStatus.Visible := False;
         sDataFim := DateTimeToStr(Now);
         MsgDlg('Reconstrução Realizada!' + #13 + #13 +
                'Inicio : ' + sDataIni + ' Termino : ' + sDataFim,
                'Atenção', mtInformation, [mbOk], 0);
      end;
   finally
      ReconstroiSaldo.FreeThreadProgresso;
   end;
   //-------------------------------------------------------------------------------------
   bbtnConfirmar.Enabled := True;
   bbtnSair.Enabled      := True;
end;
//========================================================================================
procedure TfrmMTReconstroiSaldo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   ReconstroiSaldo.Free;
   GrupoContab.Free;
end;

end.
