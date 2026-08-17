unit fCadHstPercGrupo;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//-------------------------------------------------------------------------------
//N. Atender....: WO21042
//Dt Alteração..: 02/05/2025
//Responsável...: Leandro Pocebon
//Descrição.....: Inclusão e alteração de Histórico de percentual em Grupo
//                Alterado tipo variavel lvalorPercentual
//-------------------------------------------------------------------------------
//N. Atender....: WO13084
//Dt Alteração..: 27/08/2024
//Responsável...: Luis Ferrari
//Descrição.....: Inclusão e alteração de Histórico de percentual em Grupo
//-------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, TEdNum, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, Mask, wwdbedit, uCMTypes;

type
  TfrmCadHstPercGrupo = class(TfrmCadMestreDetalheCS)
    pnlParticipante: TPanel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    edNome: TwwDBEdit;
    edPatro: TwwDBEdit;
    edPlano: TwwDBEdit;
    edMatricula: TwwDBEdit;
    wwDBEdit5: TwwDBEdit;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edProcesso: TwwDBEdit;
    edBeneficio: TwwDBEdit;
    dblkNomePensionista: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    lblQtdeParcelas: TLabel;
    Label8: TLabel;
    dtedInicio: TCMDateTimePicker;
    dtedFinal: TCMDateTimePicker;
    sbtnProcHst: TToolbarButton97;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    edPensionista: TwwDBEdit;
    edPercentual: TwwDBEdit;
    qryAux: TwwQuery;
    dsAux: TwwDataSource;
    qryBuscaDBeneficio: TwwQuery;
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnProcHstClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure edPercentualKeyPress(Sender: TObject; var Key: Char);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure dblkNomePensionistaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure abreAux;
    procedure FormResize(Sender: TObject);
    procedure preenchedblkNomePensionista;
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure dblkNomePensionistaClick(Sender: TObject);
  private
    { Private declarations }
    lIdPessoa,lIdPessJur,lIdPlanoPrev,liSeqProposta,lnumeroprocesso : integer;
    sMatricula : string;
    function BuscaDBeneficio(idBeneficio: string) : string;
  public
    { Public declarations }
  end;

var
  frmCadHstPercGrupo: TfrmCadHstPercGrupo;

implementation

uses UMensErro, UBeneficio, UDataBase, USistema, DBaseDados;

{$R *.DFM}

function TfrmCadHstPercGrupo.BuscaDBeneficio(idBeneficio: string) : string;
begin
  Result := '';
  try
    qryBuscaDBeneficio.Close;
    qryBuscaDBeneficio.SQL.Clear;
    qryBuscaDBeneficio.SQL.Add('SELECT NOME ');
    qryBuscaDBeneficio.SQL.Add('FROM BENEFICIO ');
    qryBuscaDBeneficio.SQL.Add('WHERE IDBENEFICIO = ' + QuotedStr(idBeneficio));
    qryBuscaDBeneficio.Open;

    Result := qryBuscaDBeneficio.fieldbyname('nome').AsString;

    qryBuscaDBeneficio.Close;
  Except
  end;

end;

procedure TfrmCadHstPercGrupo.bbtnOkDetClick(Sender: TObject);
begin
  if (Trim(dtedInicio.Text) <> '') and
     (Trim(dtedFinal.Text) <> '') and
     (dtedFinal.Date < dtedInicio.Date) then
  begin
     MsgDlg('A Data Final não pode ser inferior a Data Inicial do Histórico. ',
            Sistema.NomeModulo, mtInformation, [mbOk], 0);
     Repaint;
     if dtedFinal.CanFocus then
       dtedInicio.SetFocus;
     Exit;
  end;      
  inherited;

end;

procedure TfrmCadHstPercGrupo.sbtnProcHstClick(Sender: TObject);
begin
  inherited;
  if CmeCadastro.Operacao in [opInserir, opAlterar, opProcurar, opApagar] then
    exit;
  if MsgDlg('Deseja Atualizar o Histórico do percentual por grupo? ','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo then
     exit;

  if not dtmBaseDados.dbBaseDados.InTransaction then
     dtmBaseDados.dbBaseDados.StartTransaction;
  //if not (GravaHstPercGrupoHistorico(qryDet.FieldByName('IDTITULAR').AsInteger)) then //WO21042 LEANDRO
  if not (GravaHstPercGrupoHistorico(qryDet.FieldByName('IDTITULAR').AsInteger,0,-9)) then   //WO21042 LEANDRO
    begin
      MsgDlg('Erro na gravação do histórico do percentual por grupo.','Erro',mtError,[mbOK],0);
      if dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.Rollback;
    end
  else
    begin
      if dtmBaseDados.dbBaseDados.InTransaction then
        begin
          dtmBaseDados.dbBaseDados.Commit;
          qryDet.Close;
          qryDet.ParamByName('Matricula').AsString   := sMatricula;
          qryDet.ParamByName('IdPlanoPrev').AsInteger := lIdPlanoPrev;
          qryDet.Open;
          MsgDlg('Gravação do histórico do percentual por grupo finalizada.',
            Sistema.NomeModulo, mtInformation, [mbOk], 0);
          sbtnProcHst.Down := false;
        end;
    end;
end;

procedure TfrmCadHstPercGrupo.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    begin
     lIdPessoa     := StrToInt(MontaSelect.ValoresChave[0]);
     lIdPessJur    := StrToInt(MontaSelect.ValoresChave[1]);
     lIdPlanoPrev  := StrToInt(MontaSelect.ValoresChave[2]);

     qry.Close;
     qry.ParamByName('IdPessJur').AsInteger   := lIdPessJur;
     qry.ParamByName('IdPlanoPrev').AsInteger := lIdPlanoPrev;
     qry.ParamByName('IdPessoa').AsInteger    := lIdPessoa;
     qry.Open;
     sMatricula            := qry.FieldByName('Matricula').AsString;

     qryDet.Close;
     qryDet.ParamByName('Matricula').AsString   := sMatricula;
     qryDet.ParamByName('IdPlanoPrev').AsInteger := lIdPlanoPrev;
     qryDet.Open;
    end;
  sbtnProcHst.enabled   := MontaSelect.RetornouValor;

end;

procedure TfrmCadHstPercGrupo.edPercentualKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Not (Key in (['0'..'9',',',#8])) Then
    Key := #0;
end;

procedure TfrmCadHstPercGrupo.CmeCadastroConfirma(Sender: TObject);
begin
  qry.CancelUpdates;

  try
    aplicaAlteracoes([qrydet]);

  Except
    raise;
  end;

  inherited;

end;

procedure TfrmCadHstPercGrupo.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  edPensionista.Visible := false;
  dblkNomePensionista.Visible := true;
  abreAux;

end;

procedure TfrmCadHstPercGrupo.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  edPensionista.Visible := true;
  dblkNomePensionista.Visible := false;
  abreAux;
end;

procedure TfrmCadHstPercGrupo.dblkNomePensionistaChange(Sender: TObject);
begin
  inherited;
  preenchedblkNomePensionista;
end;

procedure TfrmCadHstPercGrupo.FormShow(Sender: TObject);
begin
  inherited;
  qryDet.Close;
  qryDet.ParamByName('Matricula').AsString   := '-1';
  qryDet.ParamByName('IdPlanoPrev').AsInteger := -1;
  qryDet.Open;

end;

procedure TfrmCadHstPercGrupo.bbtnConfirmarClick(Sender: TObject);
var i : integer ; //,lvalorPercentual : integer; //wo21042 leandro
    lvalorPercentual : double; //wo21042 leandro
    iCount : integer;
    sNroProcesso : string;
    sChvNroPorcesso, sChvBeneficio  : string;
    sChvDataIni, sChvDataFim : tdate;
    bm: TBookmark;
begin

  //Leandro WO13084 - inicio
  if not qryAux.Active then abreAux;

  qryAux.First;
  while not qryAux.Eof do
  Begin

    //verifica se não existe beneficio cadastrado em duplicdade para cada processo para periodo em aberto
    iCount           := 0;
    sNroProcesso     := '';

    qryDet.first;
    While not qryDet.Eof do
    begin
      if (qryDet.fieldbyname('numeroprocesso').AsString <> sNroProcesso) then
      begin
        if (qryDet.fieldbyname('idbeneficio').AsString = qryAux.fieldbyname('idbeneficio').AsString) and
           (qryDet.fieldbyname('DATAFIM').AsString = '') then
           iCount := 1
        else
           iCount := 0;
        sNroProcesso := qryDet.fieldbyname('numeroprocesso').AsString;
      end
      else
      begin
        if (qryDet.fieldbyname('idbeneficio').AsString = qryAux.fieldbyname('idbeneficio').AsString) and
           (qryDet.fieldbyname('DATAFIM').AsString = '') then
          Inc(iCount);
      end;

      if iCount > 1 then
      begin
        ShowMessage('Beneficio : ' + qryDet.fieldbyname('BENEFICIO').AsString +char(10)+char(13)+
                    'Cadastrado duplicado para o processo : ' +  qryDet.fieldbyname('numeroprocesso').AsString);
        Exit;
      end;

      qryDet.Next;
    end;

    {//verifica se percentual cadastrado para um beneficio não e superior 100% para periodo em aberto
    lvalorPercentual := 0;
    qryDet.first;
    while not qryDet.Eof  Do
    begin
      if (qryDet.fieldbyname('idbeneficio').AsString = sChvBeneficio) and
         (qryDet.fieldbyname('DATAFIM').AsString = '') then
         lvalorPercentual := lvalorPercentual + qryDet.fieldbyname('percentual').AsInteger;

      qryDet.Next;
    end;

    if lvalorPercentual > 100 then
    begin
      MsgDlg('Valor excede percentual máximo para o benefíciario %:' +char(10)+char(13)+
             qryDet.fieldbyname('BENEFICIO').AsString , Caption, mtError , [mbOk], 0);
      exit;
    end
    else
    if lvalorPercentual < 100 then
      if lvalorPercentual <> 0 then
      begin
        MsgDlg('Valores de percentual por grupo não fecham 100%:' +char(10)+char(13)+
               qryDet.fieldbyname('BENEFICIO').AsString , Caption, mtError , [mbOk], 0);
        exit;
      end;
    }
    qryAux.Next;
  end;

  //verifica se não existe beneficio cadastrado em duplicdade para o mesmo processo com periodo sobrepostos
  qryDet.first;
  While not qryDet.Eof do
  begin
    // Definir o bookmark na posição atual do dataset
    bm := QryDet. GetBookmark;

    sChvNroPorcesso  := qryDet.fieldbyname('numeroprocesso').AsString;
    sChvBeneficio    := qryDet.fieldbyname('idbeneficio').AsString;
    sChvDataIni      := qryDet.fieldbyname('DATAINICIO').AsDateTime;
    sChvDataFim      := qryDet.fieldbyname('DATAFIM').AsDateTime;
    lvalorPercentual := 0;
    iCount           := 0;

    qryDet.first;
    While not qryDet.Eof do
    begin
      if (qryDet.fieldbyname('numeroprocesso').AsString = sChvNroPorcesso) and
         (qryDet.fieldbyname('idbeneficio').AsString    = sChvBeneficio)   then
      begin
         if qryDet.fieldbyname('DATAFIM').AsDateTime <> 0 then
         begin
           if (sChvDataIni >= qryDet.fieldbyname('DATAINICIO').AsDateTime ) and
              (sChvDataIni <= qryDet.fieldbyname('DATAFIM').AsDateTime)     then
              inc(iCount)
           else
           begin
             if sChvDataFim <> 0 then
             begin
               if ((sChvDataFim >= qryDet.fieldbyname('DATAINICIO').AsDateTime) and
                  (sChvDataFim  <= qryDet.fieldbyname('DATAFIM').AsDateTime))   then
                   inc(iCount);
             end;
           end;
         end
         else
         begin
           if (sChvDataIni >= qryDet.fieldbyname('DATAINICIO').AsDateTime ) and
              (sChvDataIni <= date())     then
              inc(iCount)
           else
           begin
             if sChvDataFim <> 0 then
             begin
               if ((sChvDataIni >= qryDet.fieldbyname('DATAINICIO').AsDateTime) and
                  (sChvDataIni  <= date()))                                     then
                   inc(iCount);
             end;
           end;

         end;
      end;
      qryDet.Next;
    end;

    if iCount > 1 then
    begin
      ShowMessage('Beneficio: ' + BuscaDBeneficio(sChvBeneficio) +char(10)+char(13)+
                  'com periodo sobreposto para o processo : ' +  sChvNroPorcesso);
      Exit;
    end;

    //verifica se percentual cadastrado para um beneficio não e superior 100% para periodo em aberto
    lvalorPercentual := 0;
    qryDet.first;
    while not qryDet.Eof  Do
    begin
      if (qryDet.fieldbyname('idbeneficio').AsString    = sChvBeneficio)   then
      begin
         if qryDet.fieldbyname('DATAFIM').AsDateTime <> 0 then
         begin
           if (sChvDataIni >= qryDet.fieldbyname('DATAINICIO').AsDateTime ) and
              (sChvDataIni <= qryDet.fieldbyname('DATAFIM').AsDateTime)     then
              //lvalorPercentual := lvalorPercentual + qryDet.fieldbyname('percentual').AsInteger //wo21042 leandro
              lvalorPercentual := lvalorPercentual + qryDet.fieldbyname('percentual').AsFloat     //wo21042 leandro
           else
           begin
             if sChvDataFim <> 0 then
             begin
               if ((sChvDataFim >= qryDet.fieldbyname('DATAINICIO').AsDateTime) and
                  (sChvDataFim  <= qryDet.fieldbyname('DATAFIM').AsDateTime))   then
                   //lvalorPercentual := lvalorPercentual + qryDet.fieldbyname('percentual').AsInteger; //wo21042 leandro
                   lvalorPercentual := lvalorPercentual + qryDet.fieldbyname('percentual').AsFloat; //wo21042 leandro
             end;
           end;
         end
         else
         begin
           if (sChvDataIni >= qryDet.fieldbyname('DATAINICIO').AsDateTime ) and
              (sChvDataIni <= date())     then
              //lvalorPercentual := lvalorPercentual + qryDet.fieldbyname('percentual').AsInteger   //wo21042 leandro
              lvalorPercentual := lvalorPercentual + qryDet.fieldbyname('percentual').AsFloat       //wo21042 leandro
           else
           begin
             if sChvDataFim <> 0 then
             begin
               if ((sChvDataIni >= qryDet.fieldbyname('DATAINICIO').AsDateTime) and
                  (sChvDataIni  <= date()))                                     then
                   //lvalorPercentual := lvalorPercentual + qryDet.fieldbyname('percentual').AsInteger;  //wo21042 leandro
                   lvalorPercentual := lvalorPercentual + qryDet.fieldbyname('percentual').AsFloat;      //wo21042 leandro
             end;
           end;

         end;
      end;

      qryDet.Next;
    end;

    if lvalorPercentual > 100 then
    begin
      MsgDlg('Valor excede percentual máximo para o benefíciario %:' +char(10)+char(13)+
             BuscaDBeneficio(sChvBeneficio) , Caption, mtError , [mbOk], 0);
      exit;
    end
    else
    if ((lvalorPercentual < 100) AND
    //   ((100 - lvalorPercentual) >= 0.01)) then    //WO21042 LEANDRO
       ((100 - lvalorPercentual) >= 0.0001)) then    // WO26310 Ferrari
      if lvalorPercentual <> 0 then
      begin
        MsgDlg('Valores de percentual por grupo não fecham 100%:' +char(10)+char(13)+
               BuscaDBeneficio(sChvBeneficio) , Caption, mtError , [mbOk], 0);
        exit;
      end;

    // Retornar ao bookmark anterior, se for válido
    if qryDet.BookmarkValid(bm) then
    begin
      qryDet.GotoBookmark(bm);
      qryDet.FreeBookMark(bm);
    end;

    qryDet.Next;

  end;

  //Leandro WO13084 - fim


  inherited;

end;

procedure TfrmCadHstPercGrupo.abreAux;
begin
  qryAux.Close;
  qryAux.ParamByName('Matricula').AsString   := sMatricula;
  qryAux.ParamByName('IdPlanoPrev').AsInteger := lIdPlanoPrev;
  qryAux.Open;

end;

procedure TfrmCadHstPercGrupo.FormResize(Sender: TObject);
begin
  inherited;
  dbgrdDet.Columns[0].DisplayWidth := 50;
  dbgrdDet.Columns[2].DisplayWidth := 80;

end;

procedure TfrmCadHstPercGrupo.sbtnExcluiDetClick(Sender: TObject);
begin
  abreAux;
  if MsgDlg('Deseja excluir este registro? ' +char(10)+char(13)+
             qryDet.fieldbyname('IDHSTPERCGRUPO').AsString,'Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo then
     begin
        qryDet.Close;
        qryDet.ParamByName('Matricula').AsString   := sMatricula;
        qryDet.ParamByName('IdPlanoPrev').AsInteger := lIdPlanoPrev;
        qryDet.Open;
        exit;
     end;
  inherited;

end;

procedure TfrmCadHstPercGrupo.preenchedblkNomePensionista;
begin
  if qryDet.State <> dsinsert then
    exit;
  qryDet.fieldbyname('idpessjur').AsString := qryAux.fieldbyname('idpessjur').AsString;
  qryDet.fieldbyname('idplanoprev').AsString := qryAux.fieldbyname('idplanoprev').AsString;
  qryDet.fieldbyname('idtitular').AsString := qryAux.fieldbyname('idtitular').AsString;
  qryDet.fieldbyname('idpessoa').AsString := qryAux.fieldbyname('idpessoa').AsString;
  qryDet.fieldbyname('idbeneficio').AsString := qryAux.fieldbyname('idbeneficio').AsString;
  qryDet.fieldbyname('numeroprocesso').AsString := qryAux.fieldbyname('numeroprocesso').AsString;
  qryDet.fieldbyname('fontepagadora').AsString := qryAux.fieldbyname('fontepagadora').AsString;
  qryDet.fieldbyname('idplanoorigem').AsString := qryAux.fieldbyname('idplanoorigem').AsString;
  qryDet.fieldbyname('seqproposta').AsString := qryAux.fieldbyname('seqproposta').AsString;
  qryDet.fieldbyname('BENEFICIO').AsString := qryAux.fieldbyname('BENEFICIO').AsString;
  qryDet.fieldbyname('NOME').AsString := qryAux.fieldbyname('NOME').AsString;
  dblkNomePensionista.Text := qryAux.fieldbyname('NOME').AsString;
end;

procedure TfrmCadHstPercGrupo.dblkNomePensionistaClick(Sender: TObject);
begin
  inherited;
  preenchedblkNomePensionista;
end;

end.
