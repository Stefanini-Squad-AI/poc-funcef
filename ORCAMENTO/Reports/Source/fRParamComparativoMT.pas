// Marcus Oliveira P.24442 09/10/2007
// Andre tavares - pendência 20264 - 01/11/2005 - inclui os parâmetros idplanoprev, idpatro, codcentrocusto
// Augusto - pendência 24442 - 03/11/2007 - Ajuste nas pesquisa de Grupo de Orçamento Sintético
unit fRParamComparativoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, uCmSqlParams, Db,
  DBClient, uCMClientDataSet, wwdblook, MontaSelect;

type
  TfrmRParamComparativoMT = class(TfrmParamReports_Padrao)
    MontaSelectConta: TMontaSelect;
    Label3: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    Label4: TLabel;
    dblkPeriodoIni: TwwDBLookupCombo;
    Label6: TLabel;
    dblkPeriodoFim: TwwDBLookupCombo;
    lblCodigoConta: TLabel;
    edtCodigoConta: TEdit;
    bbtnBuscaConta: TBitBtn;
    edtNomeConta: TEdit;
    cdsExercicio: TCMClientDataSet;
    cdsPeriodoInicial: TCMClientDataSet;
    cdsPeriodoFinal: TCMClientDataSet;
    sqlPeriodoFinal: TCMSqlParams;
    sqlPeriodoInicial: TCMSqlParams;
    sqlExercicio: TCMSqlParams;
    dblkPatro: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    dblkPlano: TwwDBLookupCombo;
    dblkCentroCusto: TwwDBLookupCombo;
    Label5: TLabel;
    sqlPatro: TCMSqlParams;
    sqlPlano: TCMSqlParams;
    cdsPatro: TCMClientDataSet;
    cdsPlano: TCMClientDataSet;
    sqlCentCusto: TCMSqlParams;
    cdsCentCusto: TCMClientDataSet;
    sqlValidaPlanoPatro: TCMSqlParams;
    cdsValidaPlanoPatro: TCMClientDataSet;
    BitBtn1: TBitBtn;
    edtGrpOrcamentario: TEdit;
    Label7: TLabel;
    MSGrupoOrcamentario: TMontaSelect;
    procedure dblkExercicioClick(Sender: TObject);
    procedure edtCodigoContaExit(Sender: TObject);
    procedure bbtnBuscaContaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkPatroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkPlanoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    function validaPlanopatro: Boolean;
  public
    { Public declarations }
  end;

var
  frmRParamComparativoMT: TfrmRParamComparativoMT;

implementation

uses uSistema, UCtrlOrcamento, UModulo, UData, uMensErro;

{$R *.DFM}

procedure TfrmRParamComparativoMT.dblkExercicioClick(Sender: TObject);
begin
  inherited;
  //Preenche a combo-box de período
  if dblkExercicio.text <> '' then begin
    with sqlPeriodoInicial do begin
      cdsPeriodoInicial.Close;
      Prepare;
      ParamByName('IDPESSOA').asInteger  := Sistema.idEmpresa;
      ParamByName('EXERCICIO').asInteger := StrToInt(dblkExercicio.text);
      Open;
    end;
    with sqlPeriodoFinal do begin
      cdsPeriodoFinal.Close;
      Prepare;
      ParamByName('IDPESSOA').asInteger  := Sistema.idEmpresa;
      ParamByName('EXERCICIO').asInteger := StrToInt(dblkExercicio.text);
      Open;
    end;
  end;
end;

procedure TfrmRParamComparativoMT.edtCodigoContaExit(Sender: TObject);
var sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo,
    sNomeGrupo, sUnid, sPPrev, sCCusto, sPatro: string;
begin
  inherited;
  if edtCodigoConta.text <> '' then begin
    if OrcamentoBackMT.BuscaContaOrcamen(modulo.iPlanoOrc, edtCodigoConta.text,
       true, false, sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo,
       sNomeGrupo, sUnid, sPPrev, sCCusto, sPatro) = 0 then begin
      edtNomeConta.text  := sNomeConta;
    end else begin
      edtCodigoConta.SetFocus;
    end;
  end;
end;

procedure TfrmRParamComparativoMT.bbtnBuscaContaClick(Sender: TObject);
var sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo,
    sNomeGrupo, sUnid, sPPrev, sCCusto, sPatro: string;
begin
  inherited;
  //Busca a Conta Orçamentária
  MontaSelectConta.Executar;
  if MontaSelectConta.RetornouValor then begin
    if OrcamentoBackMT.BuscaContaOrcamen(modulo.iPlanoOrc,
       MontaSelectConta.ValoresChave[1], true, false, sNomeConta,
       sCodCentroRespon, sNomeCentroRespon, sCodGrupo, sNomeGrupo, sUnid,
       sPPrev, sCCusto, sPatro) = 0 then begin
      edtCodigoConta.text := MontaSelectConta.ValoresChave[1];
      edtNomeConta.text   := sNomeConta;
    end else begin
      edtCodigoConta.SetFocus;
    end;
  end;
end;

procedure TfrmRParamComparativoMT.FormCreate(Sender: TObject);
begin
  inherited;
  //Preenche as combo-boxes
  with sqlExercicio do begin
    Prepare;
    ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
    Open;
  end;
  with sqlPeriodoInicial do begin
    Prepare;
    ParamByName('IDPESSOA').asInteger  := Sistema.idEmpresa;
    ParamByName('EXERCICIO').asInteger := Year(Date);
    Open;
  end;
  with sqlPeriodoFinal do begin
    Prepare;
    ParamByName('IDPESSOA').asInteger  := Sistema.idEmpresa;
    ParamByName('EXERCICIO').asInteger := Year(Date);
    Open;
  end;

  sqlpatro.Open;
  sqlplano.Open;
  sqlCentCusto.Open;

  MontaSelectConta.Filtro.Add('CONTASORCAMEN.IDPLANOORCAMEN = ' + IntToStr(modulo.iPlanoOrc));

  MSGrupoOrcamentario.Filtro.Add('GRUPOORCAMEN.IDPLANOORCAMEN = ' + IntToStr(modulo.iPlanoOrc));
end;

procedure TfrmRParamComparativoMT.bbtnConfirmarClick(Sender: TObject);
var
SFiltro : String;

begin
  inherited;

  if (Trim(dblkPeriodoIni.text) = '') or (Trim(dblkPeriodoFim.text) = '') then begin
    MsgDlg('Os Períodos devem ser preenchidos.','Erro',mtError,[mbOk],0);
    ModalResult := mrNone;
  end else begin
    if StrToInt(dblkPeriodoIni.lookupvalue) >
       StrToInt(dblkPeriodoFim.lookupvalue) then begin
      MsgDlg('O Período Inicial deve ser menor ou igual ao Período Final.', 'Erro',mtError,[mbOk],0);
      ModalResult := mrNone;
    end else begin
      if OrcamentoBackMT.DiasNoPeriodo(StrToInt(dblkExercicio.text),
         StrToInt(dblkPeriodoIni.lookupvalue)) = 0 then begin
        MsgDlg('O Período Inicial não existe para o Exercício selecionado.', 'Erro',mtError,[mbOk],0);
        ModalResult := mrNone;
      end else begin
        if OrcamentoBackMT.DiasNoPeriodo(StrToInt(dblkExercicio.text),
           StrToInt(dblkPeriodoFim.lookupvalue)) = 0 then begin
          MsgDlg('O Período Final não existe para o Exercício selecionado.', 'Erro',mtError,[mbOk],0);
          ModalResult := mrNone;
        end else begin

          Cmp_Padrao.ParamValues[0].AsInteger := StrToInt(dblkExercicio.LookupValue);
          Cmp_Padrao.ParamValues[1].AsInteger := StrToInt(dblkPeriodoIni.LookupValue);
          Cmp_Padrao.ParamValues[2].AsInteger := StrToInt(dblkPeriodoFim.LookupValue);
          Cmp_Padrao.ParamValues[3].AsString  := Trim(edtCodigoConta.Text);
          Cmp_Padrao.ParamValues[4].AsString  := Trim(edtNomeConta.Text);
          Cmp_Padrao.ParamValues[5].AsString  := Trim(dblkPatro.LookupValue);
          Cmp_Padrao.ParamValues[6].AsString  := Trim(dblkPlano.LookupValue);
          Cmp_Padrao.ParamValues[7].AsString  := Trim(dblkCentroCusto.LookupValue);

          Cmp_Padrao.ParamValues[9].AsString  := dblkPeriodoIni.Text + ' a ' + dblkPeriodoFim.Text + ' de ' +
                                                 dblkExercicio.Text + '  Conta: ' + edtNomeConta.Text  +
                                                 '  Patro: '+ dblkPatro.Text + '  Plano: ' + dblkPlano.Text + '  Centro de Custo: ' + dblkCentroCusto.Text +
                                                 '  Grupo Orçamentário: ' + edtGrpOrcamentario.Text ;

          { Passar dados do Grupo de Orçamento para o relatório }
          Cmp_Padrao.ParamValues[10].AsString  := MSGrupoOrcamentario.ValoresChave[2];
          Cmp_Padrao.ParamValues[11].AsString  := MSGrupoOrcamentario.ValoresChave[3];

        end;
      end;
    end;
  end;
end;

function TfrmRParamComparativoMT.validaPlanopatro: Boolean;
begin
  result := false;
  if (trim(dblkPlano.text) <> '') and (trim(dblkPatro.text) <> '') then
  begin
   sqlValidaPlanoPatro.Prepare;
   sqlValidaPlanoPatro.ParamByName('IDPATRO').asInteger := strToint(dblkPatro.LookupValue);
   sqlValidaPlanoPatro.ParamByName('IDPLANOPREV').asInteger := strToint(dblkPlano.LookupValue);
   sqlValidaPlanoPatro.Open;
  end else
  begin
    result := true;
    abort;
  end;

  if CdsValidaPlanoPatro.IsEmpty then
  begin
    showMessage('Plano "'+ dblkPlano.text +'" e patrocinadora "'+ dblkPatro.text +'" não relacionados.');
    dblkPatro.SetFocus;
  end
  else result := true;
end;

procedure TfrmRParamComparativoMT.dblkPatroCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  validaPlanopatro;
end;

procedure TfrmRParamComparativoMT.dblkPlanoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  validaPlanopatro;
end;

procedure TfrmRParamComparativoMT.BitBtn1Click(Sender: TObject);
begin
  inherited;

  MSGrupoOrcamentario.Executar;

  if MSGrupoOrcamentario.RetornouValor then
  begin
     Cmp_Padrao.ParamValues[8].AsString  := MSGrupoOrcamentario.ValoresChave[0];
     edtGrpOrcamentario.Text := MSGrupoOrcamentario.ValoresChave[1];
     
  end;
end;

end.
