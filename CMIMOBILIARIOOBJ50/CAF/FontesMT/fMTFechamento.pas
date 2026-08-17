unit fMTFechamento;

{-------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172902/8222
Nº KINTANA..: 1577546
Data........: 28/03/2012
Responsável.: Wylliam Leite da Silva
Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
-------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons, Gauges,
  wwdbdatetimepicker, CMDateTimePicker, TB97Tlbr, TB97, ExtCtrls, IvEMulti,
  uCtrlPadroes, {uCtrlFechamento} uCtrlImobFechamento, uCtrlParamCAF, uCtrlConjunto,
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  uCtrlContab;

type
  TfrmMTFechamento = class(TfrmOkCancelar)
    Data: TLabel;
    edDataMov: TCMDateTimePicker;
    chkDeprecImob: TCheckBox;
    pnlStatus: TPanel;
    lblStatus: TLabel;
    pnlprgBar: TPanel;
    prgBar: TGauge;
    ckbLog: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edDataMovExit(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    //Fechamento : TCtrlFechamento;
    Fechamento : TCtrlImobFechamento;
    Conjunto   : TCtrlConjunto;
    ParamCAF   : TCtrlParamCAF;
    CtrlContab  : TCtrlContab; // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
    //------------------------------------------------------------------------------------
    procedure Progresso(vParam : Array of Variant);

  public
    { Public declarations }
    iGrupoDeprec,
    iGrupoDepIni, iGrupoDepFim : Integer;

  end;

var
  frmMTFechamento: TfrmMTFechamento;

implementation

{$R *.DFM}

Uses uMensErro, uSistema , uDiasUteis, JCLShell;


procedure TfrmMTFechamento.Progresso(vParam: array of Variant);
begin
   prgBar.MaxValue   := vParam[1];
   prgBar.Progress   := vParam[2];
   lblStatus.Caption := vParam[3];
   //-------------------------------------------------------------------------------------
   if (prgBar.Progress <= 1) or ((prgBar.Progress Mod 7) = 0) or (prgBar.Progress >= prgBar.MaxValue) then
      Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMTFechamento.FormCreate(Sender: TObject);
begin
   inherited;
   //Fechamento := TCtrlFechamento.Create;
   Fechamento := TCtrlImobFechamento.Create;
   Fechamento.InitializeAs(Padroes);
   Fechamento.Progresso := Progresso;
   //-------------------------------------------------------------------------------------
   Conjunto := TCtrlConjunto.Create;
   Conjunto.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   // Carga dos parâmetros do sistema
   //-------------------------------------------------------------------------------------
   if not ParamCAF.CarregaProp(Sistema.IdEmpresa) then
      Raise Exception.Create('Parâmetros do sistema inválidos!');
   //-------------------------------------------------------------------------------------
   // Calcula a Data do Fechamento a ser realizado
   //-------------------------------------------------------------------------------------
   if Sistema.IdModulo = 7 then
   begin
      if copy(ParamCAF.SISTEMAS, 4, 1) <> '1' then
      begin
         iGrupoDeprec := 2;
      end else
      begin
         if chkDeprecImob.Checked then
            iGrupoDeprec := 1
         else
            iGrupoDeprec := 0;
      end;
   end else
   begin
      iGrupoDeprec := 1;
   end;
   //-------------------------------------------------------------------------------------
   case iGrupoDeprec of
      0 : begin
             iGrupoDepIni := 0;
             iGrupoDepFim := 0;
          end;
      1 : begin
             iGrupoDepIni := 1;
             iGrupoDepFim := 1;
          end;
      2 : begin
             iGrupoDepIni := 0;
             iGrupoDepFim := 1;
          end;
      else
          begin
             iGrupoDepIni := 2;
             iGrupoDepFim := 2;
          end;
   end;
   //-------------------------------------------------------------------------------------
   edDataMov.Date := Fechamento.ProximaDataFechamento(Sistema.IdModulo, Sistema.IdEmpresa,
                                                      iGrupoDepIni, iGrupoDepFim,
                                                      chkDeprecImob.Checked);
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  CtrlContab     := TCtrlContab.Create;
  CtrlContab.InitializeAs(Padroes);
end;
//========================================================================================
procedure TfrmMTFechamento.FormShow(Sender: TObject);
begin
   inherited;
   if not Conjunto.ValidarCentroCusto(Sistema.IdEmpresa) then
      MsgDlg(Conjunto.MessageInfo, 'Atenção', mtInformation, [mbOK], 0);
end;
//========================================================================================
procedure TfrmMTFechamento.edDataMovExit(Sender: TObject);
begin
   inherited;
   if edDataMov.Text = '' then
   begin
      MsgDlg('Forneça o Data do Fechamento', 'Erro', mtError, [mbOk], 0);
      edDataMov.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Calcula a Data do Fechamento a ser realizado
   //-------------------------------------------------------------------------------------
   if Sistema.IdModulo = 7 then
   begin
      if copy(ParamCAF.SISTEMAS, 4, 1) <> '1' then
      begin
         iGrupoDeprec := 2;
      end else
      begin
         if chkDeprecImob.Checked then
            iGrupoDeprec := 1
         else
            iGrupoDeprec := 0;
      end;
   end else
   begin
      iGrupoDeprec := 1;
   end;
   //-------------------------------------------------------------------------------------
   case iGrupoDeprec of
      0 : begin
             iGrupoDepIni := 0;
             iGrupoDepFim := 0;
          end;
      1 : begin
             iGrupoDepIni := 1;
             iGrupoDepFim := 1;
          end;
      2 : begin
             iGrupoDepIni := 0;
             iGrupoDepFim := 1;
          end;
      else
          begin
             iGrupoDepIni := 2;
             iGrupoDepFim := 2;
          end;
   end;
   //-------------------------------------------------------------------------------------
   edDataMov.Date := Fechamento.ProximaDataFechamento(Sistema.IdModulo, Sistema.IdEmpresa,
                                                      iGrupoDepIni, iGrupoDepFim,
                                                      chkDeprecImob.Checked);
end;


//========================================================================================
procedure TfrmMTFechamento.bbtnConfirmarClick(Sender: TObject);
var
   sDataIni, sDataFim : String;

begin
   inherited;
   if edDataMov.Text = '' then
   begin
      MsgDlg('Data do Fechamento deve ser definida! ','Erro',mtError,[mbOk],0);
      edDataMov.SetFocus;
      exit;
   end;
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 Inicio
   if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edDataMov.Text) then
  begin
       MsgDlg ('Período bloqueado pela Contabilidade','Aviso',mtWarning,[mbok],0);
       exit;
  end;
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 Fim
   //-------------------------------------------------------------------------------------
   pnlStatus.Visible     := True;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   bbtnSair.Enabled      := False;
   //-------------------------------------------------------------------------------------
   Fechamento.CreateThreadProgresso;
   try
      sDataIni := DateTimeToStr(Now);
      if not Fechamento.ExecutaFechamento(Sistema.IdModulo, Sistema.IdEmpresa, Sistema.IdUsuario,
                                          edDataMov.Date, chkDeprecImob.Checked,
                                          Fechamento.ProgressFileName) then
      begin
         sDataFim := DateTimeToStr(Now);
         MsgDlg('Processamento Abortado.' + #13 + #13 + Fechamento.MessageInfo + #13 + #13 +
                'Inicio : ' + sDataIni + ' Termino : ' + sDataFim,
                'Erro',mtError,[mbOK],0);
      end else
      begin
         sDataFim := DateTimeToStr(Now);
         MsgDlg('Processamento Encerrado.' + #13 + #13 +
                'Inicio : ' + sDataIni + ' Termino : ' + sDataFim ,'Atenção', mtInformation, [mbOK], 0);
      end;
   finally
      Fechamento.FreeThreadProgresso;
   end;
   //-------------------------------------------------------------------------------------
   //if ckbLog.Checked then
   //   CloseFile(fLog);
   //-------------------------------------------------------------------------------------
   pnlStatus.Visible := False;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled := True;
   bbtnSair.Enabled := True;
   //-------------------------------------------------------------------------------------
   edDataMov.Date := Fechamento.ProximaDataFechamento(Sistema.IdModulo, Sistema.IdEmpresa,
                                                      iGrupoDepIni, iGrupoDepFim,
                                                      chkDeprecImob.Checked);
end;
//========================================================================================
procedure TfrmMTFechamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Fechamento.Free;
   Conjunto.Free;
   ParamCAF.Free;
   FreeAndNil(CtrlContab); // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
end;

end.
