// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Alteração   : SOL 124332 KTN 630255
// Data        : 24/02/2011
// Descrição   : Inclusão do flag SALARIO DE PARTICIPACAO
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 02.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit fCadRubricasCompoeSalarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, Buttons, StdCtrls, Db, wwdblook, DBCtrls, IvDictio,
  IvMulti, IvEMulti, MontaSelect, DBTables, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, TB97Tlbr, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask,
  wwdbedit, CmEventosCadastro, ImgList;

type
  TFrmRubricasCompoeSalarios = class(TfrmCadastroGridCS)
    GroupBox1: TGroupBox;
    dbchkCompoeSalPart: TDBCheckBox;
    dbchkCompoeSalBenef: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    wwDBLookupCombo1: TwwDBLookupCombo;
    qryPLANO: TwwQuery;
    dtsPLANO: TwwDataSource;
    Label1: TLabel;
    Label2: TLabel;
    qryIDPLANOPREV: TFloatField;
    qryFLGCOMPOESALPART: TFloatField;
    qryFLGCOMPOESALBENEF: TFloatField;
    qryFLGCOMPOEREMTOTAL: TFloatField;
    qryIDRUBRICA: TFloatField;
    qryPROVDESC: TwwQuery;
    dtsPROVDESC: TwwDataSource;
    SpeedButton1: TSpeedButton;
    MontaSelect1: TMontaSelect;
    qryPROVDESCIDPROVENTO: TFloatField;
    qryPROVDESCDESCRICAO: TStringField;
    dbidrubrica: TwwDBEdit;
    eddescidrubrica: TEdit;
    qryNOME: TStringField;
    qryDESCRICAO: TStringField;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    qryFLGSALPARTRETRO: TFloatField;
    qryFLGSALBENEFRETRO: TFloatField;
    qryFLGSALPARTATUARIA: TFloatField;
    DBCheckBox5: TDBCheckBox;
    qryFLGCOMPOESALCONT: TFloatField;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRubricasCompoeSalarios: TFrmRubricasCompoeSalarios;

implementation

{$R *.DFM}

uses USistema, UAdmPrev;

procedure TFrmRubricasCompoeSalarios.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin

    qry.Locate('IDRUBRICA',MontaSelect.ValoresChave[1],[]);
  // SOL 124332 KTN 630255
    qryPROVDESC.Locate('IDPROVENTO',MontaSelect.ValoresChave[1],[loCaseInsensitive, loPartialKey]);
    eddescidrubrica.Text := qryPROVDESC.fieldbyname('DESCRICAO').AsString;

    dbchkCompoeSalPart.Checked  := (qry.FieldByName('FLGCOMPOESALPART').AsInteger = 1);
    DBCheckBox5.Checked         := (qry.FieldByName('FLGCOMPOESALCONT').AsInteger = 1);
    dbchkCompoeSalBenef.Checked := (qry.FieldByName('FLGCOMPOESALBENEF').AsInteger = 1);
    DBCheckBox1.Checked         := (qry.FieldByName('FLGCOMPOEREMTOTAL').AsInteger = 1);
    DBCheckBox2.Checked         := (qry.FieldByName('FLGSALPARTRETRO').AsInteger = 1);
    DBCheckBox3.Checked         := (qry.FieldByName('FLGSALBENEFRETRO').AsInteger = 1);
    DBCheckBox4.Checked         := (qry.FieldByName('FLGSALPARTATUARIA').AsInteger = 1);
  // SOL 124332 KTN 630255
  end;
end;

procedure TFrmRubricasCompoeSalarios.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  MontaSelect1.Executar;
  if MontaSelect1.RetornouValor then
  begin
    qry.fieldByname('idrubrica').AsInteger := strtoint(MontaSelect1.ValoresChave[0]);
    eddescidrubrica.Text := MontaSelect1.ValoresChave[1];
  end;
end;

procedure TFrmRubricasCompoeSalarios.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  wwDBLookupCombo1.Enabled := True;
  eddescidrubrica.Text := '';
  qryPlano.Close;
  qryPlano.paramByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryPlano.Open;
  
  qryPROVDESC.Open;
  qry.FieldByName('FLGCOMPOESALPART').AsInteger  := 0;
  qry.FieldByName('FLGCOMPOESALBENEF').AsInteger := 0;
  qry.FieldByName('FLGCOMPOEREMTOTAL').AsInteger := 0;
  //by Vlad - Inicio
  Qry.FieldByName('FLGSALPARTRETRO').AsInteger   := 0;
  Qry.FieldByName('FLGSALBENEFRETRO').AsInteger  := 0;
  Qry.FieldByName('FLGSALPARTATUARIA').AsInteger := 0;
  Qry.FieldByName('FLGCOMPOESALCONT').AsInteger  := 0; // SOL 124332 KTN 630255
  //by Vlad - Fim
end;

procedure TFrmRubricasCompoeSalarios.sbtnAlterarClick(Sender: TObject);
begin
  if not qryPlano.Active    then qryPlano.Open;
  if not qryProvDesc.Active then qryPROVDESC.Open;
  inherited;
  qryProvDesc.Locate('IdProvento',qry.FieldByName('idrubrica').AsInteger,[loCaseInsensitive, loPartialKey]);
  eddescidrubrica.Text := qryProvDesc.fieldbyname('descricao').AsString;
  wwDBLookupCombo1.Enabled := false;
end;

procedure TFrmRubricasCompoeSalarios.CmeCadastroAfterConfirma(
  Sender: TObject);
begin
  inherited;
  // Adicionando Log Padrão
  Try
    If not Sistema.GravaLogOperacoes('Rubricas que Compõem os Salários') Then
      Raise Exception.Create('Erro ao gravar Log.');
  Except
  End;

end;

procedure TFrmRubricasCompoeSalarios.FormShow(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add('PROVDESCXPLANO.IDPLANOPREV IN (SELECT PLP.IDPLANOPREV FROM PLANPREVPATRO PLP, PATRO PT WHERE PLP.IDPESSJUR = PT.IDPESSOA AND PT.IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); // CAMILLE - 02.07.2003
  dbidrubrica.Text := '';

end;

procedure TFrmRubricasCompoeSalarios.bbtnConfirmarClick(Sender: TObject);
begin
   if trim(dbidrubrica.text) = '' then begin
      MessageDlg('A Rubrica deve ser informada.', mtWarning, [mbOK], 0);
      exit;
   end;

   if trim(wwDBLookupCombo1.text) = '' then begin
      MessageDlg('O Plano Previdenciário deve ser informado.', mtWarning, [mbOK], 0);
      exit;
   end;
   inherited;

end;

end.
