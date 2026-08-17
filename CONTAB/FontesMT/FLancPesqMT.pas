unit FLancPesqMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Db, Wwdatsrc, DBTables, Wwquery, MontaSelect, Wwdotdot,
  Wwdbcomb, TREdit, StdCtrls, Mask, wwdbedit, ExtCtrls, ComCtrls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97,  Grids, Wwdbigrd, Wwdbgrid,
  IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker, CMDateTimePicker,
  uCmSqlParams, DBClient, uCMClientDataSet;

type
  TfrmLancPesquisaMT = class(TfrmSairAjuda)
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    Bevel2: TBevel;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label9: TLabel;
    Label26: TLabel;
    dbeContaD: TwwDBEdit;
    dbeNomeContaD: TwwDBEdit;
    dbeNomeCCusD: TwwDBEdit;
    dbeCCusD: TwwDBEdit;
    dbeNomeAuxD: TwwDBEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbeContaC: TwwDBEdit;
    dbeNomeContaC: TwwDBEdit;
    dbeNomeCCusC: TwwDBEdit;
    dbeCCusC: TwwDBEdit;
    dbeNomeAuxC: TwwDBEdit;
    Panel1: TPanel;
    Memo1: TMemo;
    dbeHist3: TwwDBEdit;
    dbeHist1: TwwDBEdit;
    dbeHist2: TwwDBEdit;
    dbeHist4: TwwDBEdit;
    dbeHist5: TwwDBEdit;
    Panel2: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    dbeNomeUnid: TwwDBEdit;
    dbeUnid: TwwDBEdit;
    dbrValor: TDBRealEdit;
    TabSheet2: TTabSheet;
    GroupBox3: TGroupBox;
    lbConvOfDeb: TLabel;
    lbConvG1Deb: TLabel;
    Label24: TLabel;
    lbValG1Deb: TLabel;
    lbValOfDeb: TLabel;
    lbConvG2Deb: TLabel;
    lbConvG3Deb: TLabel;
    lbValG3Deb: TLabel;
    lbValG2Deb: TLabel;
    dbcmbConvOfD: TwwDBComboBox;
    dbcmbConvG1D: TwwDBComboBox;
    dbcmbConvG2D: TwwDBComboBox;
    dbcmbConvG3D: TwwDBComboBox;
    GroupBox4: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    dbcmbConvOfC: TwwDBComboBox;
    dbcmbConvG1C: TwwDBComboBox;
    dbcmbConvG2C: TwwDBComboBox;
    dbcmbConvG3C: TwwDBComboBox;
    Label1: TLabel;
    Label5: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    MontaSelect: TMontaSelect;
    dbrOfD: TDBRealEdit;
    dbrG1D: TDBRealEdit;
    dbrG2D: TDBRealEdit;
    dbrG3D: TDBRealEdit;
    dbrValHistD: TDBRealEdit;
    dbrOfC: TDBRealEdit;
    dbrG1C: TDBRealEdit;
    dbrG2C: TDBRealEdit;
    dbrG3C: TDBRealEdit;
    dbrValHistC: TDBRealEdit;
    dsLancamentos1: TwwDataSource;
    dsLancamentos2: TwwDataSource;
    lblDocumento: TLabel;
    dbeDocumento: TwwDBEdit;
    btnBusca: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    dbrAuxD: TDBRealEdit;
    dbrAuxC: TDBRealEdit;
    dsLancamentos3: TwwDataSource;
    Panel3: TPanel;
    imgParDob: TImage;
    imgCredito: TImage;
    imgDebito: TImage;
    imgIgual: TImage;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    dbeModulo: TwwDBEdit;
    dbtDataPlanilha: TCMDateTimePicker;
    dbrLanc: TDBRealEdit;
    dbrPlanilha: TDBRealEdit;
    Label21: TLabel;
    cdsLancamentos3: TCMClientDataSet;
    sqlLancamentos3: TCMSqlParams;
    sqlLancamentos2: TCMSqlParams;
    cdsLancamentos2: TCMClientDataSet;
    sqlLancamentos1: TCMSqlParams;
    cdsLancamentos1: TCMClientDataSet;

    {Procedimentos Definidos}
    procedure DesabilitaControles;
    procedure HabilitaControles;

    {Procedimentos Delphi}
    procedure FormShow(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLancPesquisaMT: TfrmLancPesquisaMT;

implementation

uses UMensErro, uDatabase, DBaseDados, uAutorizacao, uSistema, uModulo; 

{$R *.DFM}


procedure TfrmLancPesquisaMT.FormShow(Sender: TObject);
begin
   inherited;
   PageControl.ActivePage := TabSheet1;

end;



procedure TfrmLancPesquisaMT.btnBuscaClick(Sender: TObject);
begin

   inherited;

   cdsLancamentos1.Close;
   cdsLancamentos2.Close;
   cdsLancamentos3.Close;

   HabilitaControles;

   //Busca o Lançamento
   MontaSelect.Executar;
   if MontaSelect.RetornouValor then begin
      if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then begin
         //Valores a débito
         with sqlLancamentos1 do
         begin
            Prepare;
            ParamByName('PLNCODIGO').asInteger := StrToInt(MontaSelect.ValoresChave[0]);
            ParamByName('LACNUMLAN').asInteger := StrToInt(MontaSelect.ValoresChave[1]);
            ParamByName('LACDEBCRE').asString  := 'D';
            Open;
         end;
         //Valores a crédito
         with sqlLancamentos2 do
         begin
            Prepare;
            ParamByName('PLNCODIGO').asInteger := StrToInt(MontaSelect.ValoresChave[0]);
            ParamByName('LACNUMLAN').asInteger := StrToInt(MontaSelect.ValoresChave[1]);
            ParamByName('LACDEBCRE').asString  := 'C';
            Open;
         end;
         //Informações do cabeçalho da partida dobrada
         with sqlLancamentos3 do
         begin
            Prepare;
            ParamByName('PLNCODIGO').asInteger := StrToInt(MontaSelect.ValoresChave[0]);
            ParamByName('LACNUMLAN').asInteger := StrToInt(MontaSelect.ValoresChave[1]);
            Open;
         end;

         TStringField(cdsLancamentos1.FieldByName('PLACONTA')).EditMask := modulo.sMascaraContas + ';0; ';
         TStringField(cdsLancamentos2.FieldByName('PLACONTA')).EditMask := modulo.sMascaraContas + ';0; ';

         TStringField(cdsLancamentos1.FieldByName('CODCENTROCUSTO')).EditMask := Modulo.sMascaraCCusto + ';0; ';
         TStringField(cdsLancamentos2.FieldByName('CODCENTROCUSTO')).EditMask := Modulo.sMascaraCCusto + ';0; ';

         TStringField(cdsLancamentos3.FieldByName('UNECODIGO')).EditMask := Modulo.sMascaraCCusto + ';0; ';

         //Função que desabilita os controles da tela de acordo com os resultados
         DesabilitaControles;

      end;
   end;

end;



procedure TfrmLancPesquisaMT.DesabilitaControles;
begin

   if cdsLancamentos1.isEmpty then
   begin

      imgCredito.visible := true;
      imgIgual.visible   := false;

      dbeContaD.enabled     := false;
      dbeNomeContaD.enabled := false;
      dbeCCusD.enabled      := false;
      dbeNomeCCusD.enabled  := false;
      dbrAuxD.enabled       := false;
      dbeNomeAuxD.enabled   := false;

      dbeContaD.color     := clSilver;
      dbeNomeContaD.color := clSilver;
      dbeCCusD.color      := clSilver;
      dbeNomeCCusD.color  := clSilver;
      dbrAuxD.color       := clSilver;
      dbeNomeAuxD.color   := clSilver;

      dbcmbConvOfD.color := clSilver;
      dbcmbConvG1D.color := clSilver;
      dbcmbConvG2D.color := clSilver;
      dbcmbConvG3D.color := clSilver;

      dbrOfD.color := clSilver;
      dbrG1D.color := clSilver;
      dbrG2D.color := clSilver;
      dbrG3D.color := clSilver;

      dbrValHistD.color := clSilver;

   end;

   if cdsLancamentos2.isEmpty then
   begin

      imgDebito.visible := true;
      imgIgual.visible  := false;

      dbeContaC.enabled     := false;
      dbeNomeContaC.enabled := false;
      dbeCCusC.enabled      := false;
      dbeNomeCCusC.enabled  := false;
      dbrAuxC.enabled       := false;
      dbeNomeAuxC.enabled   := false;

      dbeContaC.color      := clSilver;
      dbeNomeContaC.color  := clSilver;
      dbeCCusC.color       := clSilver;
      dbeNomeCCusC.color   := clSilver;
      dbrAuxC.color        := clSilver;
      dbeNomeAuxC.color    := clSilver;

      dbcmbConvOfC.color := clSilver;
      dbcmbConvG1C.color := clSilver;
      dbcmbConvG2C.color := clSilver;
      dbcmbConvG3C.color := clSilver;

      dbrOfC.color := clSilver;
      dbrG1C.color := clSilver;
      dbrG2C.color := clSilver;
      dbrG3C.color := clSilver;

      dbrValHistC.color := clSilver;

   end;

   if not((cdsLancamentos1.IsEmpty) and (cdsLancamentos2.IsEmpty)) then
   begin
      imgIgual.visible  := false;
      imgParDob.visible := true;
   end;

end;



procedure TfrmLancPesquisaMT.HabilitaControles;
begin

   dbrLanc.value      := 0;
   dbrPlanilha.value  := 0;
   dbrValor.value     := 0;

   imgCredito.visible := false;
   imgDebito.visible  := false;
   imgParDob.visible  := false;
   imgIgual.visible   := true;

   dbeContaD.enabled     := true;
   dbeNomeContaD.enabled := true;
   dbeCCusD.enabled      := true;
   dbeNomeCCusD.enabled  := true;
   dbrAuxD.enabled       := true;
   dbeNomeAuxD.enabled   := true;

   dbeContaD.color     := clWindow;
   dbeNomeContaD.color := clWindow;
   dbeCCusD.color      := clWindow;
   dbeNomeCCusD.color  := clWindow;
   dbrAuxD.color       := clWindow;
   dbeNomeAuxD.color   := clWindow;

   dbcmbConvOfD.color := clWindow;
   dbcmbConvG1D.color := clWindow;
   dbcmbConvG2D.color := clWindow;
   dbcmbConvG3D.color := clWindow;

   dbrOfD.color := clWindow;
   dbrG1D.color := clWindow;
   dbrG2D.color := clWindow;
   dbrG3D.color := clWindow;

   dbrValHistD.color := clWindow;

   dbeContaC.enabled     := true;
   dbeNomeContaC.enabled := true;
   dbeCCusC.enabled      := true;
   dbeNomeCCusC.enabled  := true;
   dbrAuxC.enabled       := true;
   dbeNomeAuxC.enabled   := true;

   dbeContaC.color      := clWindow;
   dbeNomeContaC.color  := clWindow;
   dbeCCusC.color       := clWindow;
   dbeNomeCCusC.color   := clWindow;
   dbrAuxC.color        := clWindow;
   dbeNomeAuxC.color    := clWindow;

   dbcmbConvOfC.color := clWindow;
   dbcmbConvG1C.color := clWindow;
   dbcmbConvG2C.color := clWindow;
   dbcmbConvG3C.color := clWindow;

   dbrOfC.color := clWindow;
   dbrG1C.color := clWindow;
   dbrG2C.color := clWindow;
   dbrG3C.color := clWindow;

   dbrValHistC.color := clWindow;

end;



procedure TfrmLancPesquisaMT.FormCreate(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add('PLANILHA.IDPESSOA = '+FloatToStr(Sistema.idEmpresa));
end;

end.
