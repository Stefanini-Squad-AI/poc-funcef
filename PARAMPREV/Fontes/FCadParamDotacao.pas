// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 16.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FCadParamDotacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, wwdblook, Mask, DBCtrls,
  wwdbedit, Wwdotdot, Wwdbcomb, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, ImgList;

type
  TfrmCadParamDotacao = class(TfrmCadastroGridCS)
    Label1: TLabel;
    dblkcmbPatrocinadora: TwwDBLookupCombo;
    qryPatro: TwwQuery;
    dsPatro: TwwDataSource;
    Label2: TLabel;
    dblkcmbPlano: TwwDBLookupCombo;
    qryPlanPrev: TwwQuery;
    dsPlanPrev: TwwDataSource;
    qryContPrev: TwwQuery;
    dsContPrev: TwwDataSource;
    Label3: TLabel;
    dblkcmbContribuicao: TwwDBLookupCombo;
    Label4: TLabel;
    Label5: TLabel;
    dbedtQuantOcorrencia: TwwDBEdit;
    Label6: TLabel;
    dbcbxInclui13: TDBCheckBox;
    qryIDPESSJUR: TFloatField;
    qryIDPLANOPREV: TFloatField;
    qryIDCONTRIBUICAO: TFloatField;
    qryMESBASESALARIO: TStringField;
    qryDATAINICIO: TDateTimeField;
    qryQUANTOCORRENCIA: TFloatField;
    qryPATROCINADORA: TStringField;
    qryPLANO: TStringField;
    qryCONTRIBUICAO: TStringField;
    Label7: TLabel;
    medAno: TMaskEdit;
    cbxMes: TComboBox;
    qryMesAno: TStringField;
    Label8: TLabel;
    qryRegra: TwwQuery;
    dsRegra: TwwDataSource;
    qryFLGINCLUI13: TFloatField;
    dblkcbxIDREGRAELEGIVEL: TwwDBLookupCombo;
    qryIDREGRAELEGIVEL: TFloatField;
    dbdtDataInicio: TCMDateTimePicker;
    procedure dblkcmbPatrocinadoraChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure dblkcmbPlanoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure qryCalcFields(DataSet: TDataSet);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure FormShow(Sender: TObject);

  protected
    procedure CmeCadastroFind( Sender : TObject);
    procedure CmeCadastroInsert( Sender : TObject);
    procedure CmeCadastroEdit( Sender : TObject);
    procedure  CmeCadastroBeforeConfirma( Sender : TObject ; var Accept : Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadParamDotacao: TfrmCadParamDotacao;

implementation

uses UMensErro, USistema, UAdmPrev;

{$R *.DFM}

procedure TfrmCadParamDotacao.CmeCadastroFind( Sender : TObject);
begin
  inherited;
  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') Then
    qry.Locate('IDPESSJUR; IDPLANOPREV; IDCONTRIBUICAO',
     VarArrayOf([StrToFloat(MontaSelect.ValoresChave[0]),
                 StrToFloat(MontaSelect.ValoresChave[1]),
                 StrToFloat(MontaSelect.ValoresChave[2])]),
     [loCaseInsensitive]);
end;

procedure TfrmCadParamDotacao.CmeCadastroInsert(Sender : TObject);
begin
  inherited;
  medAno.Text := FormatDateTime('yyyy',Date);
  cbxMes.Text := '';
  qryFLGINCLUI13.AsString := '1';
  dblkcmbPatrocinadora.Enabled := True;
  dblkcmbPlano.Enabled         := True;
  dblkcmbContribuicao.Enabled  := True;
end;

procedure TfrmCadParamDotacao.CmeCadastroEdit(Sender : TObject);
begin
  inherited;
  medAno.Text := Copy(qryMESBASESALARIO.AsString,1,4);
  cbxMes.Text := Copy(qryMESBASESALARIO.AsString,6,2);
  dblkcmbPatrocinadora.Enabled := False;
  dblkcmbPlano.Enabled         := False;
  dblkcmbContribuicao.Enabled  := False;
end;

procedure TfrmCadParamDotacao.CmeCadastroBeforeConfirma(Sender : TObject ; var Accept : Boolean);
var sErros: String;
begin
  bbtnConfirmar.SetFocus;
  sErros := '';

  // Valida o mês base
  If (Length(Trim(cbxMes.Text)) < 1) or
     (StrToInt(cbxMes.Text) < 0) or
     (StrToInt(cbxMes.Text) > 12) Then
    sErros := sErros + 'O MÊS base deve ser de 1 a 12; '+chr(13);
  // Valida o ano base
  If (Length(Trim(medAno.Text)) < 1) Then
    sErros := sErros + 'O ANO base deve ser preenchido; '+chr(13);
  // Valida a data de ínicio
  If (qryDATAINICIO.IsNull) Then
    sErros := sErros + 'A DATA DE ÍNICIO deve ser preenchida; '+chr(13);
  // Valida a quantidade de ocorrências
  If (qryQUANTOCORRENCIA.AsFloat < 1) Then
    sErros := sErros + 'A QUANTIDADE DE OCORRÊNCIA deve ser maior que 0; '+chr(13);

  If sErros <> '' Then
    MsgDlg(sErros, 'Erro(s)', mtError, [mbOk], 0);

  Accept := not(sErros <> '');
end;

procedure TfrmCadParamDotacao.dblkcmbPatrocinadoraChange(Sender: TObject);
begin
  inherited;
  If (qry.State = dsInsert) or (qry.State = dsEdit) Then
    begin
      qryIDPLANOPREV.Clear;
      qryIDCONTRIBUICAO.Clear;
    end;
end;

procedure TfrmCadParamDotacao.FormActivate(Sender: TObject);
begin
  inherited;
  qryPatro.Close;
  QRYPATRO.PARAMBYNAME('IDFUNDACAO').ASINTEGER := iIdFundacao; 
  qryPatro.Open;
  qryPlanPrev.Close;
  qryPlanPrev.Open;
  qryContPrev.Close;
  qryContPrev.Open;
  qryRegra.Close;
  qryRegra.Open;
end;

procedure TfrmCadParamDotacao.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  If (Length(medAno.Text) > 0) and (Length(cbxMes.Text) > 0) Then
     qryMESBASESALARIO.AsString := medAno.Text + '/' + cbxMes.Text;

  qryPATROCINADORA.AsString := qryPatro.FieldByName('PATROCINADORA').AsString;
  qryPLANO.AsString         := qryPlanPrev.FieldByName('PLANO').AsString;
  qryCONTRIBUICAO.AsString  := qryContPrev.FieldByName('CONTRIBUICAO').AsString;
end;

procedure TfrmCadParamDotacao.dblkcmbPlanoChange(Sender: TObject);
begin
  inherited;
  If (qry.State = dsInsert) or (qry.State = dsEdit) Then
    qryIDCONTRIBUICAO.Clear;
end;

procedure TfrmCadParamDotacao.FormCreate(Sender: TObject);
begin
  inherited;
  qryPatro.Close;
  qryPlanPrev.Close;
  qryContPrev.Close;
  qryRegra.Close;

  qryPatro.Prepare;
  qryPlanPrev.Prepare;
  qryContPrev.Prepare;
  qryRegra.Prepare;
end;

procedure TfrmCadParamDotacao.FormDestroy(Sender: TObject);
begin
  inherited;
  qry.Close;
  qryPatro.Close;
  qryPlanPrev.Close;
  qryContPrev.Close;
  qryRegra.Close;

  qry.UnPrepare;
  qryPatro.UnPrepare;
  qryPlanPrev.UnPrepare;
  qryContPrev.UnPrepare;
  qryRegra.UnPrepare;
end;

procedure TfrmCadParamDotacao.qryCalcFields(DataSet: TDataSet);
begin
  inherited;
  qryMesAno.AsString := Copy(qryMESBASESALARIO.AsString,6,2)+'/'+
   Copy(qryMESBASESALARIO.AsString,1,4);
end;

procedure TfrmCadParamDotacao.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

procedure TfrmCadParamDotacao.FormShow(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add('PRD.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 
end;

end.
