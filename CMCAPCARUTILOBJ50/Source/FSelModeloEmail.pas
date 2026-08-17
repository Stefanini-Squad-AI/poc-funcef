{
--------------------------------------------------------------------------------

      TELA PARA CADASTRO DE MODELO DE E-MAIL

              Módulo          :  ContasaReceber
              Autor           :  Helio Lima Custodio
              Data de Término :  29/06/2015
              SOL             :  253577/17359
              PPM             :  842402

--------------------------------------------------------------------------------
//DFM             :
//N. SIG..........   : 65003
//Data da Alteração: : 26/03/2018
//Alteração Form:    :
//Responsável:       : Andre Imakawa
//Descrição.......   : Alteração do tamanho do campo EMAIL e NOME nos objetos
//                     do DFM.
-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
Nº SOL......: 253577/17906
Nº PPM......: 1163500
Data........: 17/11/2015
Responsável.: Helio Lima Custodio
Descrição...: Correção o e-mail utilizado para envio, deve ser o campo
              EMAILFUNCEF  da tabela PessoaFisica.
--------------------------------------------------------------------------------}
unit FSelModeloEmail;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TB97Ctls, Db, Wwdatsrc, DBCtrls, DBTables,
  Wwquery, Mask, wwdbedit, Wwdotdot, Wwdbcomb, wwdblook, Grids, Wwdbigrd,
  Wwdbgrid, DBClient, wwclient, uCmSqlParams, uCMClientDataSet, ppDB,
  ppBands, ppCache, ppClass, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppReport, ppPrnabl, ppCtrls, ppModule, raCodMod, FPreview,
  uVerificaPreenchimento, USistema, UMensErro;

type
  TFrmSelModeloEmail = class(TfrmOkCancelar)
    qryModeloEmail: TwwQuery;
    lblModeloEmail: TLabel;
    qryModeloEmailIDMODELOEMAIL: TFloatField;
    qryModeloEmailDESCRICAO: TStringField;
    cmbModeloEmail: TwwDBLookupCombo;
    TB97Imprimir: TToolbar97;
    ToolbarSep972: TToolbarSep97;
    BtnImprime: TBitBtn;
    Label1: TLabel;
    Panel2: TPanel;
    SbAdTodos: TSpeedButton;
    SbAdInverte: TSpeedButton;
    gridPartip: TwwDBGrid;
    cdsParticip: TCMClientDataSet;
    SqlParticip: TCMSqlParams;
    cdsParticipMATRICULA: TStringField;
    cdsParticipNOME: TStringField;
    cdsParticipNUDOCUMENTO: TStringField;
    cdsParticipVALORTOTAL: TFloatField;
    cdsParticipDATAVENCIMENTO: TDateTimeField;
    dsParticip: TwwDataSource;
    cdsParticipSELECIONADO: TFloatField;
    ppReportParticip: TppReport;
    ppPipelineParticip: TppBDEPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel2: TppLabel;
    ppImage1: TppImage;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel34: TppLabel;
    ppLabel36: TppLabel;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    raCodeModule1: TraCodeModule;
    cdsParticipIDMODELOEMAIL: TFloatField;
    cdsParticpEnvioEmail: TCMClientDataSet;
    FloatField1: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField2: TFloatField;
    DateTimeField1: TDateTimeField;
    FloatField3: TFloatField;
    sqlParticpEnvioEmail: TCMSqlParams;
    qryModeloEmailASSUNTO: TStringField;
    qryModeloEmailCAIXASAIDA: TStringField;
    qryModeloEmailCAIXACCO: TStringField;
    qryModeloEmailCORPOEMAIL: TMemoField;
    cdsParticipEMAIL: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridPartipFieldChanged(Sender: TObject; Field: TField);
    procedure SbAdTodosClick(Sender: TObject);
    procedure SbAdInverteClick(Sender: TObject);
    procedure BtnImprimeClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    fTelaCancelada : Boolean;
    fData : OleVariant;
    procedure AbreQueries;
    procedure FechaQueries;
    procedure DrawFundo; override;
    procedure SetCdsParticipantes(Value : TCMClientDataSet);
    procedure AtualizaEstadoBbtnConfirmar;
    procedure MarcaTodos;
    procedure InverteSelecao;
    procedure ResetaSelecaoGrid;
    procedure LimpaTela;
    procedure ResetaSelecaoCmbModeloEmail;
    function ValidaFormulario : Boolean;
  public
    property CdsParticipantes : TCMClientDataSet Write SetCdsParticipantes;
    property TelaCancelada    : Boolean Read fTelaCancelada;
    constructor Create(AOwner: TComponent); override;
    procedure CarregaCDSParticipantesEnvioEmail(var pCds : TCMClientDataSet);
  end;

var
  FrmSelModeloEmail: TFrmSelModeloEmail;

implementation

{$R *.DFM}

constructor TFrmSelModeloEmail.Create(AOwner: TComponent);
begin
      inherited Create(AOwner);
      AbreQueries;
end;

procedure TFrmSelModeloEmail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FechaQueries;
end;

procedure TFrmSelModeloEmail.AbreQueries;
begin
       qryModeloEmail.Open;
       qryModeloEmail.Filtered := False;
       qryModeloEmail.Filter := ' IDMODELOEMAIL <> 0 ';
       qryModeloEmail.Filtered := True;
       sqlParticip.Open;
end;

procedure TFrmSelModeloEmail.FechaQueries;
begin
       qryModeloEmail.Close;
       cdsParticip.Close;
end;

procedure TFrmSelModeloEmail.SetCdsParticipantes(Value : TCMClientDataSet);
begin
       cdsParticip.EmptyDataSet;

       cdsParticipMATRICULA.ReadOnly      := False;
       cdsParticipMATRICULA.ReadOnly      := False;
       cdsParticipNOME.ReadOnly           := False;
       cdsParticipEMAIL.ReadOnly          := False;
       cdsParticipNUDOCUMENTO.ReadOnly    := False;
       cdsParticipVALORTOTAL.ReadOnly     := False;
       cdsParticipDATAVENCIMENTO.ReadOnly := False;

       Value.First;
       cdsParticip.DisableControls;
       while not Value.Eof do
       begin
          cdsParticip.Append;

          cdsParticipSELECIONADO.AsInteger   := 0;
          cdsParticipMATRICULA.AsString      := Value.FieldByName('MATRICULA').AsString;
          cdsParticipNOME.AsString           := Value.FieldByName('NOME').AsString;

          //Inicio - Helio - SOL Nº 253577/17906 PPM Nº 1163500
          //cdsParticipEMAIL.AsString          := Value.FieldByName('EMAIL').AsString;
          cdsParticipEMAIL.AsString          := Value.FieldByName('EMAILFUNCEF').AsString;
          //Fim - Helio - SOL Nº 253577/17906 PPM Nº 1163500

          cdsParticipNUDOCUMENTO.AsString    := Value.FieldByName('NODOCUMENTO').AsString;
          cdsParticipVALORTOTAL.AsString     := Value.FieldByName('RSALDO').AsString;
          cdsParticipDATAVENCIMENTO.AsString := Value.FieldByName('DATAVENCTO').AsString;

          cdsParticip.Post;

          Value.Next;
       end;
       cdsParticip.EnableControls;

       cdsParticipMATRICULA.ReadOnly      := True;
       cdsParticipMATRICULA.ReadOnly      := True;
       cdsParticipNOME.ReadOnly           := True;
       cdsParticipEMAIL.ReadOnly          := True;
       cdsParticipNUDOCUMENTO.ReadOnly    := True;
       cdsParticipVALORTOTAL.ReadOnly     := True;
       cdsParticipDATAVENCIMENTO.ReadOnly := True;
end;

procedure TFrmSelModeloEmail.DrawFundo;
begin
  inherited;
  if TB97Imprimir <> nil then
     TB97Imprimir.DockPos := width-tb97OkCancelar.width-20;
end;


procedure TFrmSelModeloEmail.gridPartipFieldChanged(Sender: TObject;
  Field: TField);
begin
  inherited;
  AtualizaEstadobbtnConfirmar;
end;

procedure TFrmSelModeloEmail.AtualizaEstadoBbtnConfirmar;
begin
  cdsParticip.DisableControls;
  cdsParticip.First;
  bbtnConfirmar.Enabled := False;
  while Not cdsParticip.Eof do
  begin

        if cdsParticipSELECIONADO.AsInteger = 1 then
        begin
              bbtnConfirmar.Enabled := True;
              cdsParticip.First;
              break;
        end;

        cdsParticip.Next;
  end;
  cdsParticip.EnableControls;
end;

procedure TFrmSelModeloEmail.MarcaTodos;
begin
  cdsParticip.DisableControls;
  cdsParticip.First;
  while Not cdsParticip.Eof do
  begin
        cdsParticip.Edit;
        cdsParticipSELECIONADO.AsInteger := 1;
        cdsParticip.Post;
        cdsParticip.Next;
  end;
  cdsParticip.EnableControls;
end;

procedure TFrmSelModeloEmail.InverteSelecao;
begin
  cdsParticip.DisableControls;
  cdsParticip.First;
  while Not cdsParticip.Eof do
  begin
        cdsParticip.Edit;
        if cdsParticipSELECIONADO.AsInteger = 0 then
             cdsParticipSELECIONADO.AsInteger := 1
        else
             cdsParticipSELECIONADO.AsInteger := 0;
        cdsParticip.Post;
        cdsParticip.Next;
  end;
  cdsParticip.EnableControls;
end;

procedure TFrmSelModeloEmail.ResetaSelecaoGrid;
begin
      cdsParticip.DisableControls;
      cdsParticip.First;
      while Not cdsParticip.Eof do
      begin
            cdsParticip.Edit;
            cdsParticipSELECIONADO.AsInteger := 0;
            cdsParticip.Post;
            cdsParticip.Next;
      end;
      cdsParticip.EnableControls;
end;

procedure TFrmSelModeloEmail.ResetaSelecaoCmbModeloEmail;
begin
      qryModeloEmail.First;
      cmbModeloEmail.LookupValue := qryModeloEmailDESCRICAO.Value;
end;

procedure TFrmSelModeloEmail.LimpaTela;
begin
      ResetaSelecaoGrid;
      AtualizaEstadoBbtnConfirmar;
      cdsParticip.First;
      ResetaSelecaoCmbModeloEmail;
end;

procedure TFrmSelModeloEmail.SbAdTodosClick(Sender: TObject);
begin
  inherited;
  MarcaTodos;
  AtualizaEstadoBbtnConfirmar;
end;

procedure TFrmSelModeloEmail.SbAdInverteClick(Sender: TObject);
begin
  inherited;
  InverteSelecao;
  AtualizaEstadoBbtnConfirmar;
end;

procedure TFrmSelModeloEmail.BtnImprimeClick(Sender: TObject);
begin
  inherited;
  cdsParticip.DisableControls;
  cdsParticip.Filtered := False;
  cdsParticip.Filter := ' SELECIONADO = 1 ';
  cdsParticip.Filtered := True;

  //ppReportParticip.Print;
  TFrmPreview.CreateModalPreview(Application, ppReportParticip, 'Relação das Informações dos Participantes dos boletos a serem gerados');

  cdsParticip.Filtered := False;
  cdsParticip.EnableControls;
end;


procedure TFrmSelModeloEmail.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  LimpaTela;
end;

procedure TFrmSelModeloEmail.FormShow(Sender: TObject);
begin
  inherited;
  //ResetaSelecaoCmbModeloEmail;
  fTelaCancelada := False;
end;

procedure TFrmSelModeloEmail.bbtnSairClick(Sender: TObject);
begin
  inherited;
  fTelaCancelada := True;
end;
  

procedure TFrmSelModeloEmail.bbtnConfirmarClick(Sender: TObject);
begin

  If Not ValidaFormulario then
       Exit;

  cdsParticip.DisableControls;
  sqlParticpEnvioEmail.Open;
  cdsParticip.First;
  while Not cdsParticip.Eof do
  begin
         if cdsParticipSELECIONADO.AsInteger = 1 then
         begin
                 cdsParticpEnvioEmail.Append;
                 cdsParticpEnvioEmail.FieldByName('SELECIONADO').AsInteger   := 1;
                 cdsParticpEnvioEmail.FieldByName('MATRICULA').AsString      := cdsParticipMATRICULA.AsString;
                 cdsParticpEnvioEmail.FieldByName('NOME').AsString           := cdsParticipNOME.AsString;
                 cdsParticpEnvioEmail.FieldByName('EMAIL').AsString          := cdsParticipEMAIL.AsString;
                 cdsParticpEnvioEmail.FieldByName('NUDOCUMENTO').AsString    := cdsParticipNUDOCUMENTO.AsString;
                 cdsParticpEnvioEmail.FieldByName('VALORTOTAL').AsString     := cdsParticipVALORTOTAL.AsString;
                 cdsParticpEnvioEmail.FieldByName('DATAVENCIMENTO').AsString := cdsParticipDATAVENCIMENTO.AsString;
                 cdsParticpEnvioEmail.FieldByName('IDMODELOEMAIL').AsInteger := qryModeloEmailIDMODELOEMAIL.AsInteger;
                 cdsParticpEnvioEmail.Post;
         end;
         cdsParticip.Next;
  end;
  fData := cdsParticpEnvioEmail.Data;
  cdsParticpEnvioEmail.Close;

  ModalResult := mrOk;
end;

procedure TFrmSelModeloEmail.CarregaCDSParticipantesEnvioEmail(var pCds : TCMClientDataSet);
begin
       pCds.Data := fData;
end;

function TFrmSelModeloEmail.ValidaFormulario : Boolean;
begin 
   
   Result := False;

   try

      if cmbModeloEmail.LookupValue =  '' then
         raise EValidacao.CreateVal('O campo modelo de e-mail é obrigatório. Favor verificar.', cmbModeloEmail);

      if (Trim(qryModeloEmailCAIXASAIDA.AsString) = '') Or
         (Trim(qryModeloEmailASSUNTO.AsString) = '') Or
         (Trim(qryModeloEmailCORPOEMAIL.AsString) = '') then
         raise EValidacao.CreateVal('O cadastro do modelo do e-mail selecionado está incompleto. Favor verificar.', cmbModeloEmail);

   except
      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, Sistema.NomeModulo, mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;

   Result := True;

end;

end.
