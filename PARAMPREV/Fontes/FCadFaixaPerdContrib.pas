// Alterações:
//------------------------------------------------------------------------------
//Pendência   : SOL 253577/17819 PPM 1104948
//Responsável : Helio Lima Custódio
//Data        : 28/12/2015
//Descrição   : Criação da tela
//------------------------------------------------------------------------------

unit FCadFaixaPerdContrib;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask, DBCtrls,
  wwdbdatetimepicker, CMDateTimePicker, ComCtrls, TabControlDetalhe, Grids,
  Wwdbigrd, Wwdbgrid, UDataBase, dBaseDados, uCMTypes,uVerificaPreenchimento,
  USistema, UMensErro;


type
  TFrmCadFaixaPerdContrib = class(TfrmCadastroCS)
    tbcVigencia: TTabControlDetalhe;
    Label9: TLabel;
    Label10: TLabel;
    edtDateDTInicioVigencia: TCMDateTimePicker;
    edtDateDTFimVigencia: TCMDateTimePicker;
    tbcFaixaCalcPerc: TTabControlDetalhe;
    Label1: TLabel;
    dbedtFaixaInicial: TDBEdit;
    dbedtFaixaFinal: TDBEdit;
    dbedtPercentual: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    grdPlanDisponivel: TwwDBGrid;
    qryPlanDisponivel: TwwQuery;
    dsPlanDisponivel: TwwDataSource;
    grdPlanAssociado: TwwDBGrid;
    bntRemovePlano: TButton;
    bntRemoveTodosPlano: TButton;
    bntAddPlan: TButton;
    grdContribDisponivel: TwwDBGrid;
    bntRemoveContrib: TButton;
    bntRemoveTodosContrib: TButton;
    bntAddContrib: TButton;
    grdContribAssociado: TwwDBGrid;
    dsPlanAssociado: TwwDataSource;
    qryPlanAssociado: TwwQuery;
    dsContribDisponivel: TwwDataSource;
    qryContribDisponivel: TwwQuery;
    dsContribAssociado: TwwDataSource;
    qryContribAssociado: TwwQuery;
    updPlanAssociado: TUpdateSQL;
    updContribAssociado: TUpdateSQL;
    qryIDFAIXASPROVISAOPERDACONTRIB: TFloatField;
    qryINICIOVIGENCIA: TDateTimeField;
    qryFIMVIGENCIA: TDateTimeField;
    qryFAIXAINICIAL: TFloatField;
    qryFAIXAFINAL: TFloatField;
    qryPERCENTUAL: TFloatField;
    qryIDPLANOPREV: TFloatField;
    qryIDCONTRIBUICAO: TFloatField;
    qryTRGUSERINCLUSAO: TStringField;
    qryTRGDTINCLUSAO: TDateTimeField;
    qryTRGUSERALTERACAO: TStringField;
    qryTRGDTALTERACAO: TDateTimeField;
    bntAddTodosPlan: TButton;
    bntAddTodosContrib: TButton;
    updPlanDisponivel: TUpdateSQL;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryPlanDisponivelAfterScroll(DataSet: TDataSet);
    procedure bntAddPlanClick(Sender: TObject);
    procedure bntRemovePlanoClick(Sender: TObject);
    procedure bntRemoveTodosPlanoClick(Sender: TObject);
    procedure bntAddContribClick(Sender: TObject);
    procedure bntRemoveContribClick(Sender: TObject);
    procedure bntRemoveTodosContribClick(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure qryAfterCancel(DataSet: TDataSet);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bntAddTodosPlanClick(Sender: TObject);
    procedure bntAddTodosContribClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    lstIdsCarregadas : TStringList;
    IterandoQryContribAssociado : Boolean;

    procedure AbreQryVazia;
    procedure ExecDelete;
    procedure ExecUpdate;
    procedure ExecInsert;
    procedure CarregaListComPlanContribSel(var lstPlanContrib : TStringList);
    function GetPosSplit(valor, delimitador : String; pos : Integer) : String;
    procedure CarregaIdsCarregas;
    procedure CarregaQryPlanAssociadoSEL;
    procedure CarregaQryContribAssociadoSEL;
    function VerificaPreenchimento:Boolean;
    function VerificaParametrizacaoJaCadastrada : Boolean;
    procedure FiltraQryPlanDisponivelSel;
    procedure FiltraqryContribDisponivelSel;
  public
  end;
  
var
  FrmCadFaixaPerdContrib: TFrmCadFaixaPerdContrib;

implementation

{$R *.DFM}

procedure TFrmCadFaixaPerdContrib.FormShow(Sender: TObject);
begin
  inherited;
  lstIdsCarregadas := TStringList.Create;

  AbreQryVazia;
  qryPlanDisponivel.Open;
  qryPlanAssociado.Open;
  qryContribAssociado.Open;
end;

procedure TFrmCadFaixaPerdContrib.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qry.Close;
  qryPlanDisponivel.Close;
  qryPlanAssociado.Close;
  qryContribDisponivel.Close;
  qryContribAssociado.Close;

  FreeAndNil(lstIdsCarregadas);
end;

procedure TFrmCadFaixaPerdContrib.AbreQryVazia;
begin
      qry.Close;
      qry.ParamByName('INICIOVIGENCIA').Clear;
      qry.ParamByName('FIMVIGENCIA').Clear;
      qry.ParamByName('FAIXAINICIAL').Clear;
      qry.ParamByName('FAIXAFINAL').Clear;
      qry.ParamByName('PERCENTUAL').Clear;
      qry.Open;
end;

procedure TFrmCadFaixaPerdContrib.qryPlanDisponivelAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if IterandoQryContribAssociado then
       Exit;


  qryContribDisponivel.Close;
  qryContribDisponivel.ParamByName('IDPLANOPREV').AsInteger :=
        qryPlanAssociado.FieldByName('IDPLANOPREVPREV').AsInteger;

  qryContribDisponivel.Open;
  FiltraqryContribDisponivelSel;
end;

procedure TFrmCadFaixaPerdContrib.bntAddPlanClick(Sender: TObject);
var
     idPlanoPrev,
     idPlanoPrevPrev : Integer;
     nome : String;
begin
  inherited;

   if (qryPlanDisponivel.FieldByName('IDPLANOPREV').AsString =  '') Or
     (qryPlanDisponivel.FieldByName('IDPLANOPREVPREV').AsString = '') then
     Exit;

  idPlanoPrev := qryPlanDisponivel.FieldByName('IDPLANOPREV').AsInteger;
  idPlanoPrevPrev := qryPlanDisponivel.FieldByName('IDPLANOPREVPREV').AsInteger;
  nome := qryPlanDisponivel.FieldByName('NOME').AsString;


  if qryPlanAssociado.Locate('IDPLANOPREV;IDPLANOPREVPREV',
                             vararrayof([idPlanoPrev, idPlanoPrevPrev]),
                             []) then
      Exit;

  qryPlanAssociado.Insert;
  qryPlanAssociado.FieldByName('IDPLANOPREV').AsInteger := idPlanoPrev;
  qryPlanAssociado.FieldByName('IDPLANOPREVPREV').AsInteger := idPlanoPrevPrev;
  qryPlanAssociado.FieldByName('NOME').AsString := nome;
  qryPlanAssociado.Post;

  FiltraQryPlanDisponivelSel;
end;

procedure TFrmCadFaixaPerdContrib.bntRemovePlanoClick(Sender: TObject);
begin
  inherited;
  if qryPlanAssociado.RecordCount > 0 then
       qryPlanAssociado.Delete;

  FiltraQryPlanDisponivelSel;
end;

procedure TFrmCadFaixaPerdContrib.bntRemoveTodosPlanoClick(
  Sender: TObject);
begin
  inherited;
  qryPlanAssociado.Close;
  qryPlanAssociado.ParamByName('INICIOVIGENCIA').Clear;
  qryPlanAssociado.ParamByName('FIMVIGENCIA').Clear;
  qryPlanAssociado.ParamByName('FAIXAINICIAL').Clear;
  qryPlanAssociado.ParamByName('FAIXAFINAL').Clear;
  qryPlanAssociado.ParamByName('PERCENTUAL').Clear;
  qryPlanAssociado.Open;
  qryPlanDisponivel.Filtered := False;
end;

procedure TFrmCadFaixaPerdContrib.bntAddContribClick(Sender: TObject);
var
     idContribuicao : Integer;
     nome : String;
begin
  inherited;
  idContribuicao := qryContribDisponivel.FieldByName('IDCONTRIBUICAO').AsInteger;
  nome := qryContribDisponivel.FieldByName('NOME').AsString;

  if qryContribAssociado.Locate('IDCONTRIBUICAO',
                                idContribuicao,
                                []) then
      Exit;

  qryContribAssociado.Insert;
  qryContribAssociado.FieldByName('IDCONTRIBUICAO').AsInteger := idContribuicao;
  qryContribAssociado.FieldByName('NOME').AsString := nome;
  qryContribAssociado.Post;

  FiltraqryContribDisponivelSel;
end;

procedure TFrmCadFaixaPerdContrib.bntRemoveContribClick(Sender: TObject);
begin
  inherited;
  if qryContribAssociado.RecordCount > 0 then
       qryContribAssociado.Delete;

  FiltraqryContribDisponivelSel;
end;

procedure TFrmCadFaixaPerdContrib.bntRemoveTodosContribClick(
  Sender: TObject);
begin
  inherited;
  qryContribAssociado.Close;
  qryContribAssociado.ParamByName('INICIOVIGENCIA').Clear;
  qryContribAssociado.ParamByName('FIMVIGENCIA').Clear;
  qryContribAssociado.ParamByName('FAIXAINICIAL').Clear;
  qryContribAssociado.ParamByName('FAIXAFINAL').Clear;
  qryContribAssociado.ParamByName('PERCENTUAL').Clear;
  qryContribAssociado.Open;

  FiltraqryContribDisponivelSel;
end;

procedure TFrmCadFaixaPerdContrib.ExecDelete;
var
    qryDeleteOld : TWWQuery;
    idFaixaProv,
    inicioVigencia,
    fimVigencia,
    faixaInicial,
    faixaFinal,
    percentual : String;
begin
       if qry.RecordCount < 1 then
           Exit;

       //exclui as outras faixas
       idFaixaProv := qry.FieldByName('IDFAIXASPROVISAOPERDACONTRIB').OldValue;
       if qry.FieldByName('INICIOVIGENCIA').OldValue = NULL then inicioVigencia := '' else inicioVigencia := qry.FieldByName('INICIOVIGENCIA').OldValue;
       if qry.FieldByName('FIMVIGENCIA').OldValue = NULL    then fimVigencia := ''    else fimVigencia := qry.FieldByName('FIMVIGENCIA').OldValue;
       if qry.FieldByName('FAIXAINICIAL').OldValue = NULL   then faixaInicial := ''   else faixaInicial := qry.FieldByName('FAIXAINICIAL').OldValue;
       if qry.FieldByName('FAIXAFINAL').OldValue = NULL     then faixaFinal := ''     else faixaFinal := qry.FieldByName('FAIXAFINAL').OldValue;
       if qry.FieldByName('PERCENTUAL').OldValue = NULL     then percentual := ''     else percentual := qry.FieldByName('PERCENTUAL').OldValue;

       qry.Close;
       if inicioVigencia = '' then qry.ParamByName('INICIOVIGENCIA').Clear else qry.ParamByName('INICIOVIGENCIA').AsString := inicioVigencia;
       if fimVigencia = ''    then qry.ParamByName('FIMVIGENCIA').Clear    else qry.ParamByName('FIMVIGENCIA').AsString := fimVigencia;
       if faixaInicial = ''   then qry.ParamByName('FAIXAINICIAL').Clear   else qry.ParamByName('FAIXAINICIAL').AsString := faixaInicial;
       if faixaFinal = ''     then qry.ParamByName('FAIXAFINAL').Clear     else qry.ParamByName('FAIXAFINAL').AsString := faixaFinal;
       if percentual = ''     then qry.ParamByName('PERCENTUAL').Clear     else qry.ParamByName('PERCENTUAL').AsString := percentual;
       qry.Open;

       qry.First;
       while qry.RecordCount > 0 do
       begin
           qry.Delete;
       end;
end;

procedure TFrmCadFaixaPerdContrib.ExecUpdate;
var
    qryDeleteOld : TWWQuery;
    inicioVigencia,
    fimVigencia,
    faixaInicial,
    faixaFinal,
    percentual : String;
begin
       qryDeleteOld := TWWQuery.Create(Application);
       qryDeleteOld.DatabaseName := dtmBaseDados.dbBaseDados.DataBaseName;

       if qry.FieldByName('INICIOVIGENCIA').OldValue = NULL then inicioVigencia := 'IS NULL' else inicioVigencia := qry.FieldByName('INICIOVIGENCIA').OldValue;
       if qry.FieldByName('FIMVIGENCIA').OldValue = NULL    then fimVigencia := 'IS NULL'    else fimVigencia := qry.FieldByName('FIMVIGENCIA').OldValue;
       if qry.FieldByName('FAIXAINICIAL').OldValue = NULL   then faixaInicial := 'IS NULL'   else faixaInicial := qry.FieldByName('FAIXAINICIAL').OldValue;
       if qry.FieldByName('FAIXAFINAL').OldValue = NULL     then faixaFinal := 'IS NULL'     else faixaFinal := qry.FieldByName('FAIXAFINAL').OldValue;
       if qry.FieldByName('PERCENTUAL').OldValue = NULL     then percentual := 'IS NULL'     else percentual := qry.FieldByName('PERCENTUAL').OldValue;

       if inicioVigencia <> 'IS NULL' then inicioVigencia := ' =' + QuotedStr(inicioVigencia);
       if fimVigencia <> 'IS NULL' then fimVigencia := ' =' + QuotedStr(fimVigencia);
       if faixaInicial <> 'IS NULL' then faixaInicial := ' =' + faixaInicial;
       if faixaFinal <> 'IS NULL' then faixaFinal := ' =' + faixaFinal;
       if percentual <> 'IS NULL' then percentual := ' =' + percentual;

       qryDeleteOld.SQL.Clear;
       qryDeleteOld.SQL.Text := ' DELETE FROM FAIXASPROVISAOPERDACONTRIB ' +#13+
                                ' WHERE INICIOVIGENCIA '  + inicioVigencia +#13+
                                '       AND FIMVIGENCIA ' + fimVigencia +#13+
                                '       AND FAIXAINICIAL '+ faixaInicial +#13+
                                '       AND FAIXAFINAL '  + faixaFinal +#13+
                                '       AND PERCENTUAL '  + percentual +' ';

       qryDeleteOld.ExecSQL;
       qryDeleteOld.Free;

       ExecInsert;
end;

procedure TFrmCadFaixaPerdContrib.ExecInsert;
var
     lstPlanContrib : TStringList;
     inicioVigencia,
     fimVigencia,
     faixaInicial,
     faixaFinal,
     percentual,
     planSel,
     contribSel : String;
     i : Integer;
begin
       lstPlanContrib := TStringList.Create;


       CarregaListComPlanContribSel(lstPlanContrib);

       inicioVigencia := qry.FieldByName('INICIOVIGENCIA').AsString;
       fimVigencia    := qry.FieldByName('FIMVIGENCIA').AsString;
       faixaInicial   := qry.FieldByName('FAIXAINICIAL').AsString;
       faixaFinal     := qry.FieldByName('FAIXAFINAL').AsString;
       percentual     := qry.FieldByName('PERCENTUAL').AsString;

       AbreQryVazia;

       for i := 0 to lstPlanContrib.Count - 1 do
       begin
              if Not(qry.State in [dsInsert]) then qry.Insert;
              qry.FieldByName('INICIOVIGENCIA').AsString := inicioVigencia;
              qry.FieldByName('FIMVIGENCIA').AsString    := fimVigencia;
              qry.FieldByName('FAIXAINICIAL').AsString   := faixaInicial;
              qry.FieldByName('FAIXAFINAL').AsString     := faixaFinal;
              qry.FieldByName('PERCENTUAL').AsString     := percentual;
              planSel    := GetPosSplit(lstPlanContrib[i], ';', 0);
              contribSel := GetPosSplit(lstPlanContrib[i], ';', 1);
              qry.FieldByName('IDPLANOPREV').AsString := planSel;
              qry.FieldByName('IDCONTRIBUICAO').AsString := contribSel;
              qry.Post;
       end;

       lstPlanContrib.Free;
end;

procedure TFrmCadFaixaPerdContrib.CarregaListComPlanContribSel(var lstPlanContrib : TStringList);
var
     qryMaior : TWWQuery;
     planSel,
     contribSel : String;
begin
         if qryPlanAssociado.RecordCount < qryContribAssociado.RecordCount then
              qryMaior := qryContribAssociado
         else
              qryMaior := qryPlanAssociado;


         qryPlanAssociado.DisableControls;
         qryContribAssociado.DisableControls;
         qryPlanAssociado.First;
         qryContribAssociado.First;
         IterandoQryContribAssociado := True;
         while Not qryMaior.Eof do
         begin
                planSel := '';
                contribSel := '';
                if Not qryContribAssociado.Eof then
                begin
                       contribSel := qryContribAssociado.FieldByName('IDCONTRIBUICAO').AsString;
                       qryContribAssociado.Next;
                end;

                if Not qryPlanAssociado.Eof then
                begin
                       planSel := qryPlanAssociado.FieldByName('IDPLANOPREV').AsString;
                       qryPlanAssociado.Next;
                end;

                lstPlanContrib.Add(planSel + ';' + contribSel);
         end;
         IterandoQryContribAssociado := False;

         qryPlanAssociado.EnableControls;
         qryContribAssociado.EnableControls;
end;

function TFrmCadFaixaPerdContrib.GetPosSplit(valor, delimitador : String; pos : Integer) : String;
var
     lstTemp : TStringList;
begin
       lstTemp := TStringList.Create;

       lstTemp.Text := StringReplace(valor, delimitador, #13#10, [rfReplaceAll]);

       if pos < lstTemp.Count then
           Result := lstTemp[pos]
       else
           Result := '';

       lstTemp.Free;
end;


procedure TFrmCadFaixaPerdContrib.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if (VerificaPreenchimento) and
     (VerificaParametrizacaoJaCadastrada) then
      Accept := true
  else
      Accept := false;

  if Accept then
  begin
      ExecUpdate;
  end;
end;

procedure TFrmCadFaixaPerdContrib.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if (VerificaPreenchimento) and
     (VerificaParametrizacaoJaCadastrada) then
      Accept := true
  else
      Accept := false;

  if Accept then
      ExecInsert;
end;

procedure TFrmCadFaixaPerdContrib.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  ExecDelete;
end;

procedure TFrmCadFaixaPerdContrib.CmeCadastroAtualizaBotoes(
  Sender: TObject);
begin
  inherited;
  if (CmeCadastro.Operacao in [opVazio]) or
     (qry.State in [dsInsert]) then
  begin
        bntRemoveTodosContribClick(nil);
        bntRemoveTodosPlanoClick(nil);
  end;
end;

procedure TFrmCadFaixaPerdContrib.qryAfterCancel(DataSet: TDataSet);
begin
  inherited;
  if qry.RecordCount > 0 then
  begin
        CarregaQryPlanAssociadoSel;
        CarregaQryContribAssociadoSel;
  end else
  begin
        bntRemoveTodosContribClick(nil);
        bntRemoveTodosPlanoClick(nil);
  end;
end;

procedure TFrmCadFaixaPerdContrib.CarregaQryPlanAssociadoSel;
begin
       qryPlanAssociado.Close;
       if qry.FieldByName('INICIOVIGENCIA').IsNull then qryPlanAssociado.ParamByName('INICIOVIGENCIA').Clear else qryPlanAssociado.ParamByName('INICIOVIGENCIA').AsDateTime := qry.FieldByName('INICIOVIGENCIA').AsDateTime;
       if qry.FieldByName('FIMVIGENCIA').IsNull then qryPlanAssociado.ParamByName('FIMVIGENCIA').Clear else qryPlanAssociado.ParamByName('FIMVIGENCIA').AsDateTime    := qry.FieldByName('FIMVIGENCIA').AsDateTime;
       if qry.FieldByName('FAIXAINICIAL').IsNull then qryPlanAssociado.ParamByName('FAIXAINICIAL').Clear else qryPlanAssociado.ParamByName('FAIXAINICIAL').AsFloat      := qry.FieldByName('FAIXAINICIAL').AsFloat;
       if qry.FieldByName('FAIXAFINAL').IsNull then qryPlanAssociado.ParamByName('FAIXAFINAL').Clear else qryPlanAssociado.ParamByName('FAIXAFINAL').AsFloat        := qry.FieldByName('FAIXAFINAL').AsFloat;
       if qry.FieldByName('PERCENTUAL').IsNull then qryPlanAssociado.ParamByName('PERCENTUAL').Clear else qryPlanAssociado.ParamByName('PERCENTUAL').AsFloat        := qry.FieldByName('PERCENTUAL').AsFloat;
       qryPlanAssociado.Open;
end;

procedure TFrmCadFaixaPerdContrib.CarregaQryContribAssociadoSel;
begin
       qryContribAssociado.Close;
       if qry.FieldByName('INICIOVIGENCIA').IsNull then qryContribAssociado.ParamByName('INICIOVIGENCIA').Clear else qryContribAssociado.ParamByName('INICIOVIGENCIA').AsDateTime := qry.FieldByName('INICIOVIGENCIA').AsDateTime;
       if qry.FieldByName('FIMVIGENCIA').IsNull then qryContribAssociado.ParamByName('FIMVIGENCIA').Clear else qryContribAssociado.ParamByName('FIMVIGENCIA').AsDateTime    := qry.FieldByName('FIMVIGENCIA').AsDateTime;
       if qry.FieldByName('FAIXAINICIAL').IsNull then qryContribAssociado.ParamByName('FAIXAINICIAL').Clear else qryContribAssociado.ParamByName('FAIXAINICIAL').AsFloat      := qry.FieldByName('FAIXAINICIAL').AsFloat;
       if qry.FieldByName('FAIXAFINAL').IsNull then qryContribAssociado.ParamByName('FAIXAFINAL').Clear else qryContribAssociado.ParamByName('FAIXAFINAL').AsFloat        := qry.FieldByName('FAIXAFINAL').AsFloat;
       if qry.FieldByName('PERCENTUAL').IsNull then qryContribAssociado.ParamByName('PERCENTUAL').Clear else qryContribAssociado.ParamByName('PERCENTUAL').AsFloat        := qry.FieldByName('PERCENTUAL').AsFloat;
       qryContribAssociado.Open;
end;




procedure TFrmCadFaixaPerdContrib.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
      qry.Close;
      if MontaSelect.ValoresChave[0] = '' then qry.ParamByName('INICIOVIGENCIA').Clear else qry.ParamByName('INICIOVIGENCIA').AsString := MontaSelect.ValoresChave[0];
      if MontaSelect.ValoresChave[1] = '' then qry.ParamByName('FIMVIGENCIA').Clear    else qry.ParamByName('FIMVIGENCIA').AsString    := MontaSelect.ValoresChave[1];
      if MontaSelect.ValoresChave[2] = '' then qry.ParamByName('FAIXAINICIAL').Clear   else qry.ParamByName('FAIXAINICIAL').AsString   := MontaSelect.ValoresChave[2];
      if MontaSelect.ValoresChave[3] = '' then qry.ParamByName('FAIXAFINAL').Clear     else qry.ParamByName('FAIXAFINAL').AsString     := MontaSelect.ValoresChave[3];
      if MontaSelect.ValoresChave[4] = '' then qry.ParamByName('FAIXAFINAL').Clear     else qry.ParamByName('PERCENTUAL').AsString     := MontaSelect.ValoresChave[4];
      qry.Open;
      CarregaQryPlanAssociadoSel;
      CarregaQryContribAssociadoSel;
      CarregaIdsCarregas;
      qryPlanDisponivelAfterScroll(Nil);
      FiltraQryPlanDisponivelSel;
      FiltraqryContribDisponivelSel;
  end;
end;

procedure TFrmCadFaixaPerdContrib.CarregaIdsCarregas;
begin
       lstIdsCarregadas.Clear;

       qry.First;
       while Not qry.Eof do
       begin
             lstIdsCarregadas.Add(qryIDFAIXASPROVISAOPERDACONTRIB.AsString);
             qry.Next;
       end;

       qry.First;
end;

procedure TFrmCadFaixaPerdContrib.sbtnApagarClick(Sender: TObject);
var
    inicioVigencia,
    fimVigencia,
    faixaInicial,
    faixaFinal,
    percentual : String;
begin
  if qry.FieldByName('INICIOVIGENCIA').AsString = NULL then inicioVigencia := '' else inicioVigencia := qry.FieldByName('INICIOVIGENCIA').AsString;
  if qry.FieldByName('FIMVIGENCIA').AsString = NULL    then fimVigencia := ''    else fimVigencia := qry.FieldByName('FIMVIGENCIA').AsString;
  if qry.FieldByName('FAIXAINICIAL').AsString = NULL   then faixaInicial := ''   else faixaInicial := qry.FieldByName('FAIXAINICIAL').AsString;
  if qry.FieldByName('FAIXAFINAL').AsString = NULL     then faixaFinal := ''     else faixaFinal := qry.FieldByName('FAIXAFINAL').AsString;
  if qry.FieldByName('PERCENTUAL').AsString = NULL     then percentual := ''     else percentual := qry.FieldByName('PERCENTUAL').AsString;

  qry.Close;
  if inicioVigencia = '' then qry.ParamByName('INICIOVIGENCIA').Clear else qry.ParamByName('INICIOVIGENCIA').AsString := inicioVigencia;
  if fimVigencia = ''    then qry.ParamByName('FIMVIGENCIA').Clear    else qry.ParamByName('FIMVIGENCIA').AsString := fimVigencia;
  if faixaInicial = ''   then qry.ParamByName('FAIXAINICIAL').Clear   else qry.ParamByName('FAIXAINICIAL').AsString := faixaInicial;
  if faixaFinal = ''     then qry.ParamByName('FAIXAFINAL').Clear     else qry.ParamByName('FAIXAFINAL').AsString := faixaFinal;
  if percentual = ''     then qry.ParamByName('PERCENTUAL').Clear     else qry.ParamByName('PERCENTUAL').AsString := percentual;
  qry.Open;
  inherited;
end;

function TFrmCadFaixaPerdContrib.VerificaPreenchimento:Boolean;
begin
   
   Result := False;

   try
      if length(trim(edtDateDTInicioVigencia.Text)) = 0 then
         raise EValidacao.CreateVal('A data de início da vigência é obrigatória.', edtDateDTInicioVigencia);

      if edtDateDTInicioVigencia.Date < EncodeDate(1999, 01, 01) then
         raise EValidacao.CreateVal('A data de início deverá ser maior ou igual a 01/01/1999.', edtDateDTInicioVigencia);

      if length(trim(edtDateDTFimVigencia.Text)) > 0 then
      if edtDateDTInicioVigencia.Date > edtDateDTFimVigencia.Date then
         raise EValidacao.CreateVal('A data final da vigência deverá ser maior ou igual a data início da vigência.', edtDateDTInicioVigencia);

      if length(trim(dbedtFaixaInicial.Text)) = 0 then
         raise EValidacao.CreateVal('A faixa inicial é obrigatória.', dbedtFaixaInicial);

      if length(trim(dbedtFaixaInicial.Text)) > 0 then
      if StrToFloat(dbedtFaixaInicial.Text) <= 0 then
         raise EValidacao.CreateVal('A faixa inicial deverá ser maior ou igual a 0.', dbedtFaixaInicial);

      if length(trim(dbedtFaixaFinal.Text)) = 0 then
         raise EValidacao.CreateVal('A faixa final é obrigatória.', dbedtFaixaFinal);

      if StrToFloat(dbedtFaixaFinal.Text) < StrToFloat(dbedtFaixaInicial.Text) then
         raise EValidacao.CreateVal('A faixa final deverá ser maior ou igual a faixa inicial.', dbedtFaixaFinal);
      
      if length(trim(dbedtPercentual.Text)) = 0 then
         raise EValidacao.CreateVal('O percentual é obrigatório.', dbedtPercentual);

      if length(trim(dbedtPercentual.Text)) > 0 then
      if (StrToFloat(dbedtPercentual.Text) < 0) or
         (StrToFloat(dbedtPercentual.Text) > 100) then
         raise EValidacao.CreateVal('O percentual deverá ser maior que 0 e menor ou igual a 100.', dbedtPercentual);

      if qryPlanAssociado.RecordCount < 1 then
         raise EValidacao.CreateVal('É necessário associar pelo menos um plano previdenciário.', grdPlanDisponivel);

      if qryContribAssociado.RecordCount < 1 then
         raise EValidacao.CreateVal('É necessário associar pelo menos uma contribuição. ', grdContribDisponivel);

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

function TFrmCadFaixaPerdContrib.VerificaParametrizacaoJaCadastrada : Boolean;
var
     qryTemp : TWWQuery;
     strIds : String;
begin
  inherited;
  Result := True;

  strIds := StringReplace(Trim(lstIdsCarregadas.Text), #13#10, ', ', [rfReplaceAll, rfIgnoreCase]);
  LastDelimiter(',', strIds);

  qryTemp := TwwQuery.Create(Application);
  qryTemp.DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;


  qryTemp.Close;
  qryTemp.SQL.Clear;

  qryTemp.SQL.Text := 'SELECT 1 FROM FAIXASPROVISAOPERDACONTRIB ' +#13+
                      ' WHERE INICIOVIGENCIA = TO_DATE(' + QuotedStr(qryINICIOVIGENCIA.AsString) + ', ''DD/MM/YYYY'')' +#13+
                      ' AND FAIXAINICIAL = ' + StringReplace(qryFAIXAINICIAL.AsString, ',', '.', [rfIgnoreCase, rfReplaceAll]) +#13+
                      ' AND FAIXAFINAL = ' + StringReplace(qryFAIXAFINAL.AsString, ',', '.', [rfIgnoreCase, rfReplaceAll]);
                      //' AND PERCENTUAL = ' + StringReplace(qryPERCENTUAL.AsString, ',', '.', [rfIgnoreCase, rfReplaceAll]);

  if qryFIMVIGENCIA.AsString = '' then
     qryTemp.SQL.Text := qryTemp.SQL.Text + ' AND FIMVIGENCIA IS NULL'
  else
     qryTemp.SQL.Text := qryTemp.SQL.Text + ' AND FIMVIGENCIA = TO_DATE(' + QuotedStr(qryFIMVIGENCIA.AsString) + ', ''DD/MM/YYYY'') ';

  if qry.State in [dsEdit] then
      qryTemp.SQL.Text := qryTemp.SQL.Text + ' AND IDFAIXASPROVISAOPERDACONTRIB NOT IN( ' + strIds + ')';

  qryTemp.Open;

  if Not qryTemp.IsEmpty then
  begin
    Result := False;

    if qryFIMVIGENCIA.AsString = '' then
         MsgDlg('Existe uma vigência cadastrada com as mesmas informações. É necessário incluir a data final da vigência já cadastrada.',Sistema.NomeModulo, mtInformation,[mbOk],0)
    else
         MsgDlg('Existe uma vigência cadastrada com as mesmas informações.',Sistema.NomeModulo, mtInformation,[mbOk],0);
  end;

  qryTemp.Close;
  qryTemp.Free;
end;

procedure TFrmCadFaixaPerdContrib.FiltraQryPlanDisponivelSel;
var
    filtro : String;
begin
       qryPlanAssociado.DisableControls;

       filtro := '';
       qryPlanAssociado.First;
       While Not qryPlanAssociado.Eof do
       begin
             if filtro <> '' then filtro := filtro + ' AND ';

             filtro := filtro + '(Not (' +
                                ' IDPLANOPREV = ' + qryPlanAssociado.FieldByName('IDPLANOPREV').AsString +
                                ' AND IDPLANOPREVPREV = ' + qryPlanAssociado.FieldByName('IDPLANOPREVPREV').AsString +
                                '))';

             qryPlanAssociado.Next;
       end;

       qryPlanAssociado.EnableControls;



       qryPlanDisponivel.Filtered := False;

       if filtro <> '' then
       begin
              qryPlanDisponivel.Filter := filtro;
              qryPlanDisponivel.Filtered := True;
       end;
end;

procedure TFrmCadFaixaPerdContrib.FiltraqryContribDisponivelSel;
var
    filtro : String;
begin
       qryContribAssociado.DisableControls;

       filtro := '';
       qryContribAssociado.First;
       While Not qryContribAssociado.Eof do
       begin
             if filtro <> '' then filtro := filtro + ' AND ';

             filtro := filtro + '(Not IDCONTRIBUICAO = ' + qryContribAssociado.FieldByName('IDCONTRIBUICAO').AsString +')';

             qryContribAssociado.Next;
       end;

       qryContribAssociado.EnableControls;



       qryContribDisponivel.Filtered := False;

       if filtro <> '' then
       begin
              qryContribDisponivel.Filter := filtro;
              qryContribDisponivel.Filtered := True;
       end;
end;

procedure TFrmCadFaixaPerdContrib.bntAddTodosPlanClick(Sender: TObject);
var
     idPlanoPrev,
     idPlanoPrevPrev : Integer;
     nome : String;
begin
  inherited;


  qryPlanDisponivel.DisableControls;
  qryPlanDisponivel.First;
  while Not qryPlanDisponivel.Eof do
  begin
    
    idPlanoPrev := qryPlanDisponivel.FieldByName('IDPLANOPREV').AsInteger;
    idPlanoPrevPrev := qryPlanDisponivel.FieldByName('IDPLANOPREVPREV').AsInteger;
    nome := qryPlanDisponivel.FieldByName('NOME').AsString;

    if qryPlanAssociado.Locate('IDPLANOPREV;IDPLANOPREVPREV',
                             vararrayof([idPlanoPrev, idPlanoPrevPrev]),
                             []) then
    begin
      qryPlanDisponivel.Next;
      Continue;
    end;

    qryPlanAssociado.Insert;
    qryPlanAssociado.FieldByName('IDPLANOPREV').AsInteger := idPlanoPrev;
    qryPlanAssociado.FieldByName('IDPLANOPREVPREV').AsInteger := idPlanoPrevPrev;
    qryPlanAssociado.FieldByName('NOME').AsString := nome;
    qryPlanAssociado.Post;

    qryPlanDisponivel.Next;
  end;
  qryPlanDisponivel.EnableControls;

  qryPlanDisponivel.Filtered := False;
  qryPlanDisponivel.Filter := 'IDPLANOPREV = -1';
  qryPlanDisponivel.Filtered := True;
end;

procedure TFrmCadFaixaPerdContrib.bntAddTodosContribClick(Sender: TObject);
var
     idContribuicao : Integer;
     nome : String;
begin
  inherited;

  qryContribDisponivel.DisableControls;
  qryContribDisponivel.First;
  while Not qryContribDisponivel.Eof do
  begin
    
    idContribuicao := qryContribDisponivel.FieldByName('IDCONTRIBUICAO').AsInteger;
    nome := qryContribDisponivel.FieldByName('NOME').AsString;

    if qryContribAssociado.Locate('IDCONTRIBUICAO',
                                  idContribuicao,
                                  []) then
    begin
      qryContribDisponivel.Next;
      Continue;
    end;

    qryContribAssociado.Insert;
    qryContribAssociado.FieldByName('IDCONTRIBUICAO').AsInteger := idContribuicao;
    qryContribAssociado.FieldByName('NOME').AsString := nome;
    qryContribAssociado.Post;

    qryContribDisponivel.Next;
  end;
  qryContribDisponivel.EnableControls;

  qryContribDisponivel.Filtered := False;
  qryContribDisponivel.Filter := 'IDCONTRIBUICAO = -1';
  qryContribDisponivel.Filtered := True;
end;

procedure TFrmCadFaixaPerdContrib.CmeCadastroAfterConfirma(
  Sender: TObject);
var
    inicioVigencia,
    fimVigencia,
    faixaInicial,
    faixaFinal,
    percentual : String;
begin
  inherited;

  inicioVigencia := qry.FieldByName('INICIOVIGENCIA').AsString;
  fimVigencia    := qry.FieldByName('FIMVIGENCIA').AsString;
  faixaInicial   := qry.FieldByName('FAIXAINICIAL').AsString;
  faixaFinal     := qry.FieldByName('FAIXAFINAL').AsString;
  percentual     := qry.FieldByName('PERCENTUAL').AsString;

  qry.Close;
  if inicioVigencia = '' then qry.ParamByName('INICIOVIGENCIA').Clear else qry.ParamByName('INICIOVIGENCIA').AsString := inicioVigencia;
  if fimVigencia = ''    then qry.ParamByName('FIMVIGENCIA').Clear    else qry.ParamByName('FIMVIGENCIA').AsString := fimVigencia;
  if faixaInicial = ''   then qry.ParamByName('FAIXAINICIAL').Clear   else qry.ParamByName('FAIXAINICIAL').AsString := faixaInicial;
  if faixaFinal = ''     then qry.ParamByName('FAIXAFINAL').Clear     else qry.ParamByName('FAIXAFINAL').AsString := faixaFinal;
  if percentual = ''     then qry.ParamByName('PERCENTUAL').Clear     else qry.ParamByName('PERCENTUAL').AsString := percentual;
  qry.Open;

  CarregaQryPlanAssociadoSel;
  CarregaQryContribAssociadoSel;
  CarregaIdsCarregas;
  qryPlanDisponivelAfterScroll(Nil);
end;

end.
