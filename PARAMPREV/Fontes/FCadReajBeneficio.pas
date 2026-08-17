// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 10.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Rotina    : DesfazRetencaoEncerramento
// Autor(a)  : Camille
// Data      : 13.08.2002
// Alteração : Desfazer Retencao e Encerramento baseado no lote do movimento
// -----------------------------------------------------------------------------
// Rotina    : Lay-Out da Tela
// Autor(a)  : Augusto
// Data      : 10.07.2002
// Alteração : Inclusão do Painel com o Nome do Plano escolhido
//------------------------------------------------------------------------------

unit FCadReajBeneficio;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, wwdblook, CmEventosCadastro, ImgList,
  DBCtrls;

type
  TfrmCadReajBeneficio = class(TfrmCadastroCS)
    qryRegra: TwwQuery;
    qryGrid: TwwQuery;
    dsGrid: TwwDataSource;
    qryBenefPlanPrev: TwwQuery;
    qryAux: TwwQuery;
    qryBenefSemRegra: TwwQuery;
    GroupBox2: TGroupBox;
    dbgrdReajINSS: TwwDBGrid;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label4: TLabel;
    sbtnCopiar: TSpeedButton;
    dblkpcmbBeneficio: TwwDBLookupCombo;
    PnlPlano: TPanel;
    dblkpcmbRegra: TwwDBLookupCombo;
    grpAnoMes: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edAno: TEdit;
    edMes: TEdit;
    DBRadioGroup1: TDBRadioGroup;
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure qryGridAfterScroll(DataSet: TDataSet);
    procedure dblkpcmbBeneficioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure sbtnCopiarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
  private
    { Private declarations }
    sAno, sMes : string;
    stEstadoAntes : TDataSetState;
    iIdBenefAntes : longint;
  public
    { Public declarations }
  end;

var
  frmCadReajBeneficio: TfrmCadReajBeneficio;

implementation

uses UAdmPrev, UMensErro, usistema;

{$R *.DFM}

procedure TfrmCadReajBeneficio.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')
  then begin
     qry.Close;
     qry.ParamByName('MesReaj').AsString := MontaSelect.ValoresChave[0];
     qry.ParamByName('IdPlanoPrev').AsInteger := StrToInt(sIdPlano);
     qry.ParamByName('IdBeneficio').AsInteger := StrToInt(MontaSelect.ValoresChave[1]);
     qry.Open;


     qryBenefPlanPrev.Close;
     qryBenefPlanPrev.ParamByName('IdPlanoPrev').AsInteger := StrToInt(sIdPlano);
     qryBenefPlanPrev.Open;

     qryGrid.Close;
     qryGrid.ParamByName('IdPlanoPrev').AsInteger := StrToInt(sIdPlano);
     qryGrid.ParamByName('IdBeneficio').AsInteger := StrToInt(MontaSelect.ValoresChave[1]);
     qryGrid.Open;

     qryGrid.Locate('MesReaj',qry.FieldByName('MesReaj').AsString,[loCaseInsensitive]);
     sAno := Copy(qry.FieldByName('MesReaj').AsString,1,4);
     sMes := Copy(qry.FieldByName('MesReaj').AsString,6,2);
     edAno.Text := sAno;
     edMes.Text := sMes;
  end;
end;
procedure TfrmCadReajBeneficio.CmeCadastroInsert(Sender: TObject);
begin
  inherited;

  // Se estava inserindo, colocar no combo o beneficio
  // que estava sendo usado
  if stEstadoAntes = dsInsert
  then begin
     qryBenefPlanPrev.Locate('IdBeneficio',iIdBenefAntes,[loCaseInsensitive]);
     dblkpcmbBeneficio.Text := qryBenefPlanPrev.FieldByName('Nome').AsString;
     dblkpcmbBeneficio.PerformSearch;
     qryGrid.Close;
     qryGrid.ParamByName('IdPlanoPrev').AsInteger := StrToInt(sIdPlano);
     qryGrid.ParamByName('IdBeneficio').AsInteger := qryBenefPlanPrev.FieldByName('IdBeneficio').AsInteger;
     qryGrid.Open;
  end;

  edAno.SetFocus;
end;

procedure TfrmCadReajBeneficio.FormActivate(Sender: TObject);
begin
  inherited;
  edAno.Text := '';
  edMes.Text := '';
  dblkpcmbRegra.Text := '';

  stEstadoAntes := dsBrowse;

  qryRegra.Close;
  qryRegra.Open;

  qryBenefPlanPrev.Close;
  qryBenefPlanPrev.ParamByName('IdPlanoPrev').AsInteger := StrToInt(sIdPlano);
  qryBenefPlanPrev.Open;

  qry.Close;
  qry.ParamByName('MesReaj').AsString := '0000/00';
  qry.ParamByName('IdPlanoPrev').AsInteger := -1;
  qry.ParamByName('IdBeneficio').AsInteger := -1;
  qry.Open;
end;

procedure TfrmCadReajBeneficio.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not qry.Active then Exit;
  if qry.State = dsInsert
  then begin
     edAno.Text := '';
     edMes.Text := '';
     dblkpcmbRegra.Text := '';
  end
  else begin
     sAno := Copy(qry.FieldByName('MesReaj').AsString,1,4);
     sMes := Copy(qry.FieldByName('MesReaj').AsString,6,2);
     edAno.Text := sAno;
     edMes.Text := sMes;
  end;
end;

procedure TfrmCadReajBeneficio.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  sAno := Trim(edAno.Text);
  sMes := Trim(edMes.Text);
  if (StrToInt(sMes) <= 9) and (Length(Trim(sMes)) < 2)
  then sMes := '0'+sMes;
  qry.FieldByName('IdPlanoPrev').AsInteger := StrToInt(sIdPlano);
  qry.FieldByName('MesReaj').AsString      := sAno+'/'+sMes;

  stEstadoAntes := qry.State;
  iIdBenefAntes := qryBenefPlanPrev.FieldByName('IdBeneficio').AsInteger;
end;

procedure TfrmCadReajBeneficio.bbtnConfirmarClick(Sender: TObject);
begin
  // verificar campos obrigatorios
  if Trim(edAno.Text) = ''
  then begin
     MsgDlg('Informe o Ano de Reajuste. ','Erro',mtError,[mbOk,mbHelp],0);
     edAno.SetFocus;
     Exit;
  end;

  if Trim(edMes.Text) = ''
  then begin
     MsgDlg('Informe o Mês de Reajuste. ','Erro',mtError,[mbOk,mbHelp],0);
     edMes.SetFocus;
     Exit;
  end;

  if Trim(dblkpcmbBeneficio.Text) = ''
  then begin
     MsgDlg('Informe o Benefício. ','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbBeneficio.SetFocus;
     Exit;
  end;

  if Trim(dblkpcmbRegra.Text) = ''
  then begin
     MsgDlg('Informe a Regra de Reajuste. ','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbRegra.SetFocus;
     Exit;
  end;

  inherited;

  qryGrid.Close;
  qryGrid.ParamByName('IdPlanoPrev').AsInteger := StrToInt(sIdPlano);
  qryGrid.ParamByName('IdBeneficio').AsInteger := qryBenefPlanPrev.FieldByName('IdBeneficio').AsInteger;
  qryGrid.Open;
  qryGrid.Locate('MesReaj',qry.FieldByName('MesReaj').AsString,[loCaseInsensitive]);
end;

procedure TfrmCadReajBeneficio.qryGridAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if ds.DataSet.State = dsEdit
  then begin
     qry.Close;
     qry.ParamByName('MesReaj').AsString := qryGrid.FieldByName('MesReaj').AsString;
     qry.ParamByName('IdPlanoPrev').AsInteger := StrToInt(sIdPlano);
     qry.ParamByName('IdBeneficio').AsInteger := qryGrid.FieldByName('IdBeneficio').AsInteger;
     qry.Open;
     qryRegra.Locate('IdRegra',qry.FieldByName('IdRgReaj').AsInteger,[loCaseInsensitive]);
     sAno := Copy(qry.FieldByName('MesReaj').AsString,1,4);
     sMes := Copy(qry.FieldByName('MesReaj').AsString,6,2);
     edAno.Text := sAno;
     edMes.Text := sMes;
     sbtnAlterarClick(Application);
  end;
end;

procedure TfrmCadReajBeneficio.dblkpcmbBeneficioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryGrid.Close;
  qryGrid.ParamByName('IdPlanoPrev').AsInteger := StrToInt(sIdPlano);
  qryGrid.ParamByName('IdBeneficio').AsInteger := qryBenefPlanPrev.FieldByName('IdBeneficio').AsInteger;
  qryGrid.Open;
end;

procedure TfrmCadReajBeneficio.sbtnCopiarClick(Sender: TObject);
begin

  // verificar campos obrigatorios
  if Trim(edAno.Text) = ''
  then begin
     MsgDlg('Informe o Ano de Reajuste. ','Erro',mtError,[mbOk,mbHelp],0);
     edAno.SetFocus;
     Exit;
  end;

  if Trim(edMes.Text) = ''
  then begin
     MsgDlg('Informe o Mês de Reajuste. ','Erro',mtError,[mbOk,mbHelp],0);
     edMes.SetFocus;
     Exit;
  end;

  if Trim(dblkpcmbBeneficio.Text) = ''
  then begin
     MsgDlg('Informe o Benefício. ','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbBeneficio.SetFocus;
     Exit;
  end;

  if Trim(dblkpcmbRegra.Text) = ''
  then begin
     MsgDlg('Informe a Regra de Reajuste. ','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbRegra.SetFocus;
     Exit;
  end;

  sAno := Trim(edAno.Text);
  sMes := Trim(edMes.Text);
  if (StrToInt(sMes) <= 9) and (Length(Trim(sMes)) < 2)
  then sMes := '0'+sMes;

  if MsgDlg('Confirma a atualização da Regra de Reajuste de todos '+#13+
            'os benefícios do mês '+sMes+'/'+sAno+' deste plano ? ','Confirmação',mtConfirmation,[mbYes, mbNo,mbHelp],0) = mrYes
  then begin
    // Atualizar os que já existem
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' UPDATE REAJBENEFICIO SET IDRGREAJ = '+qryRegra.FieldByName('IdRegra').AsString+
                   ' WHERE  MESREAJ = '''+sAno+'/'+sMes+''''+
                   ' AND    IDPLANOPREV = '+sIdPlano);
    try
       qryAux.ExecSQL;
    except
       MsgDlg('Erro na atualização. ','Erro',mtError,[mbOk,mbHelp],0);
       Exit;
    end;
    MsgDlg('Atualização efetuada com sucesso. ','Informação',mtInformation,[mbOk,mbHelp],0);
  end;

  if MsgDlg('Confirma a inclusão da Regra de Reajuste de todos '+#13+
            'os benefícios que não possuem regra no mês '+sMes+'/'+sAno+' deste plano ? ','Confirmação',mtConfirmation,[mbYes, mbNo,mbHelp],0) = mrYes
  then begin
     // Inserir os que nao existem
     qryBenefSemRegra.Close;
     qryBenefSemRegra.ParamByName('MesReaj').AsString := sAno+'/'+sMes;
     qryBenefSemRegra.ParamByName('IdPlanoPrev').AsInteger := StrtoInt(sIdPlano);
     qryBenefSemRegra.ParamByName('IdBeneficio').AsInteger := qryBenefPlanPrev.FieldByName('IdBeneficio').AsInteger;
     qryBenefSemRegra.Open;
     while not qryBenefSemRegra.Eof do
     begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' INSERT INTO REAJBENEFICIO (MESREAJ, IDRGREAJ, IDPLANOPREV, IDBENEFICIO) '+
                       ' VALUES ('''+sAno+'/'+sMes+''', '+
                                     qryRegra.FieldByName('IdRegra').AsString+','+
                                     sIdPlano+','+
                                     qryBenefSemRegra.FieldByName('IdBeneficio').AsString+')');
        try
           qryAux.ExecSQL;
        except
           MsgDlg('Erro na inserção. ','Erro',mtError,[mbOk,mbHelp],0);
           Exit;
        end;
        qryBenefSemRegra.Next;
     end; 
     MsgDlg('Inserção efetuada com sucesso. ','Informação',mtInformation,[mbOk,mbHelp],0);
  end;
end;

procedure TfrmCadReajBeneficio.FormShow(Sender: TObject);
begin
  inherited;
  PnlPlano.Caption      := sNomePlano; 
  MontaSelect.Filtro[1] := 'R.IDPLANOPREV = '+OraNumero(sIdPlano);
  MontaSelect.Filtro.Add('R.IDPLANOPREV IN (SELECT PLP.IDPLANOPREV FROM PLANPREVPATRO PLP, PATRO P '+ 
                         '                  WHERE   P.IDFUNDACAO = '+IntToStr(iIdFundacao)          +
                         '                  AND     PLP.IDPESSJUR = P.IDPESSOA )                   ');
end;

procedure TfrmCadReajBeneficio.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
    
    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

end.
