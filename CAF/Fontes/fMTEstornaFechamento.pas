unit fMTEstornaFechamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti,   MAHlpBtn, StdCtrls, Buttons, Gauges,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, IvEMulti, CMDateTimePicker,
  uCtrlPadroes, uCtrlFechamento, uCtrlParamCAF;

type
  TfrmMTEstornaFechamento = class(TfrmOkCancelar)
    Data: TLabel;
    edDataMov: TCMDateTimePicker;
    chkDeprecImob: TCheckBox;
    pnlStatus: TPanel;
    lblStatus: TLabel;
    pnlprgBar: TPanel;
    prgBar: TGauge;
    ckbLog: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure edDataMovExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);

  private
    { Private declarations }
    Fechamento : TCtrlFechamento;
    ParamCAF   : TCtrlParamCAF;
    //------------------------------------------------------------------------------------
    procedure Progresso(vParam : Array of Variant);

  public
    { Public declarations }
    iGrupoDeprec,
    iGrupoDepIni, iGrupoDepFim : Integer;

  end;

var
  frmMTEstornaFechamento: TfrmMTEstornaFechamento;

implementation

{$R *.DFM}

Uses uMensErro, uSistema , uDiasUteis, JCLShell;


procedure TfrmMTEstornaFechamento.Progresso(vParam: array of Variant);
begin
   prgBar.MaxValue   := vParam[1];
   prgBar.Progress   := vParam[2];
   lblStatus.Caption := vParam[3];
   //-------------------------------------------------------------------------------------
   if (prgBar.Progress <= 1) or ((prgBar.Progress Mod 7) = 0) or (prgBar.Progress >= prgBar.MaxValue) then
      Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMTEstornaFechamento.FormCreate(Sender: TObject);
begin
   inherited;
   Fechamento := TCtrlFechamento.Create;
   Fechamento.InitializeAs(Padroes);
   Fechamento.Progresso := Progresso;
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
   edDataMov.Date := Fechamento.UltimaDataFechamento(Sistema.IdEmpresa, iGrupoDepIni, iGrupoDepFim);
end;
//========================================================================================
procedure TfrmMTEstornaFechamento.edDataMovExit(Sender: TObject);
begin
   inherited;
   if edDataMov.Text = '' then
   begin
      MsgDlg('Forneça o Data do Fechamento a Estornar', 'Erro', mtError, [mbOk], 0);
      edDataMov.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Calcula a Data do Fechamento a ser estornado
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
   edDataMov.Date := Fechamento.UltimaDataFechamento(Sistema.IdEmpresa, iGrupoDepIni, iGrupoDepFim);
end;
//========================================================================================
procedure TfrmMTEstornaFechamento.bbtnConfirmarClick(Sender: TObject);
var
   sDataIni, sDataFim : String;

begin
   inherited;
   if edDataMov.Text = '' then
   begin
      MsgDlg('Data do Estorno do Fechamento deve ser definida!' ,
             'Erro', mtError, [mbOk], 0);
      edDataMov.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   pnlStatus.Visible     := True;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   bbtnSair.Enabled      := False;

   Fechamento.CreateThreadProgresso;
   try
      sDataIni := DateTimeToStr(Now);
      if not Fechamento.EstornaFechamento(Sistema.IdModulo, Sistema.IdEmpresa, Sistema.IdUsuario,
                                          edDataMov.Date,edDataMov.Date,
                                          chkDeprecImob.Checked,
                                          Fechamento.ProgressFileName) then
      begin
         sDataFim := DateTimeToStr(Now);
         MsgDlg('Processamento Abortado.' + #13 + #13 +
                Fechamento.MessageInfo + #13 + #13 +
                'Inicio : ' + sDataIni + ' Termino : ' + sDataFim,
                'Erro',mtError,[mbOK],0);
      end else
      begin
         sDataFim := DateTimeToStr(Now);
         MsgDlg('Processamento Encerrado.' + #13 + #13 +
                'Inicio : ' + sDataIni + ' Termino : ' + sDataFim,
                'Informação', mtInformation, [mbOK], 0);
      end;
   finally
      Fechamento.FreeThreadProgresso;
   end;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
   bbtnSair.Enabled      := True;
   pnlStatus.Visible     := False;
   //-------------------------------------------------------------------------------------
   edDataMov.Date := Fechamento.UltimaDataFechamento(Sistema.IdEmpresa, iGrupoDepIni, iGrupoDepFim);
end;
//========================================================================================
procedure TfrmMTEstornaFechamento.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
   inherited;
   Fechamento.Free;
   ParamCAF.Free;
end;

end.

