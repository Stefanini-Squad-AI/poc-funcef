//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_3
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//********************************************************************************************************
//Data	 :  09/09/2005
//Codigo :  AL_2
//Função :  Passa o AutoEdit do datasource para false (DFM)
//********************************************************************************************************
//Data	 :  02/09/2005
//Codigo :  AL_1
//Função :  Carga automática para preencher o primeiro histórico de prorrogação de vencimento
//********************************************************************************************************

unit FCadRepacVenc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCsInvFMD, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, fcLabel, Grids, Wwdbigrd, Wwdbgrid,
  ExtCtrls, Mask, wwdbedit, TREdit, wwdbdatetimepicker, CMDateTimePicker,
  uCtrlInvContab;

type
  TFrmCadRepacVenc = class(TFrmCadastroGridCSInvFMD)
    lblInvestimento: TLabel;
    dbdDataOperacao: TCMDateTimePicker;
    Label1: TLabel;
    Label5: TLabel;
    dbrQtdeOperacao: TDBRealEdit;
    Label17: TLabel;
    dbePuOperacao: TDBRealEdit;
    Label16: TLabel;
    dbrVlrOperacao: TDBRealEdit;
    Label8: TLabel;
    dbdDtaEmissao: TCMDateTimePicker;
    Label7: TLabel;
    dbePUEmissao: TDBRealEdit;
    dbdDataVigencia: TCMDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    dbdVenctoAnt: TCMDateTimePicker;
    Label4: TLabel;
    dbeInvestimento: TwwDBEdit;
    qryOperAplic: TwwQuery;
    qryOperAplicDESCINVESTIMENTO: TStringField;
    qryOperAplicDATAOPERACAO: TDateTimeField;
    qryOperAplicQTDEOPERACAO: TFloatField;
    qryOperAplicPUOPERACAO: TFloatField;
    qryOperAplicVLROPERACAO: TFloatField;
    qryOperAplicDATAEMISSAO: TDateTimeField;
    qryOperAplicPUEMISSAO: TFloatField;
    qryOperAplicIDOPERRENFIX: TFloatField;
    dsOperAplic: TwwDataSource;
    qryIDOPERRENFIX: TFloatField;
    qryDATAVIGENCIA: TDateTimeField;
    qryDATAVENCTOANT: TDateTimeField;
    qryDATAVENCTOATU: TDateTimeField;
    dbdVenctoAtu: TCMDateTimePicker;
    qryOperAplicVENCOPERACAO: TDateTimeField;
    qryAux: TwwQuery;
    qryOperAplicIDINVESTIMENTO: TFloatField;
    qryOperAplicIDPLANPREVCTBPATR: TFloatField;
    qryOperAplicIDCLASSETIT: TFloatField;
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure sbtnInserirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    dDataReproc: TdateTime;
    procedure Sel(iOper: Integer);
    function AtuVencOper(iOper: Integer): Boolean;
  public
    { Public declarations }
  end;

var
  FrmCadRepacVenc: TFrmCadRepacVenc;

implementation

uses UmensErro, USistema, dBaseDados, UOperComum, URendaFixa,
     UBibliotecaInvest;

{$R *.DFM}


procedure TFrmCadRepacVenc.Sel(iOper: Integer);
begin
   OperComum.LimpaParametros(qryOperAplic);
   qryOperAplic.ParamByName('IDOPERRENFIX').AsInteger := iOper;
   qryOperAplic.Open;

   OperComum.LimpaParametros(qry);
   qry.ParamByName('IDOPERRENFIX').AsInteger := iOper;
   qry.Open;

//AL_3

   sbtnInserir.Enabled := ((qryOperAplic.State = dsBrowse) and (qryOperAplic.RecordCount > 0));
end;

procedure TFrmCadRepacVenc.CmeCadastroFind(Sender: TObject);
begin
   if MontaSelect.RetornouValor then
      Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TFrmCadRepacVenc.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := False;
   if Trim(dbdVenctoAnt.Text) = '' then
   begin
      MsgDlg('Favor preencher a data de vencimento anterior', 'Mensagem do Sistema', MtWarning,[MbOk],0);
      Exit;
   end;

   if Trim(dbdVenctoAtu.Text) = '' then
   begin
      MsgDlg('Favor preencher a data de vencimento atual', 'Mensagem do Sistema', MtWarning,[MbOk],0);
      Exit;
   end;

   if qry.State = dsInsert then
   begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT IDOPERRENFIX ');
      qryAux.SQL.Add('FROM HISTOPERRENFIX ');
      qryAux.SQL.Add('WHERE IDOPERRENFIX = ' + qryOperAplicIDOPERRENFIX.AsString + ' ');
      qryAux.SQL.Add('  AND DATAVIGENCIA = TO_DATE(''' + dbdDataVigencia.Text + ''',''DD/MM/YYYY, HH24:MI:SS'')');
      qryAux.Open;
      if not qryAux.IsEmpty then
      begin
         MsgDlg('Data / hora de vigência já existente', 'Mensagem do Sistema', MtWarning,[MbOk],0);
         if dbdDataVigencia.CanFocus then
            dbdDataVigencia.SetFocus;
         Exit;
      end;
      qryAux.Close;
      qryAux.SQL.Clear;
   end;

   dDataReproc := 0;
   Accept := True;
end;

procedure TFrmCadRepacVenc.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   if ds.DataSet.State in [dsInsert] then
   begin
      qry.FieldByName('IDOPERRENFIX').AsInteger := qryOperAplicIDOPERRENFIX.AsInteger;
      qry.FieldByName('DATAVIGENCIA').AsDateTime := Now;
      qry.FieldByName('DATAVENCTOANT').AsDateTime := qryOperAplicVENCOPERACAO.AsDateTime;
      qry.FieldByName('DATAVENCTOATU').AsDateTime := qryOperAplicVENCOPERACAO.AsDateTime;
   end;
end;

procedure TFrmCadRepacVenc.FormShow(Sender: TObject);
begin
   inherited;
   dbGrd.BringToFront;
   Sel(-1);
   //AL_1
   RendaFixa.IncPriHistVenc;
end;

procedure TFrmCadRepacVenc.bbtnConfirmarClick(Sender: TObject);
var dDataVenc: TDateTime;
begin
   CmeCadastro.RepetirInsert := False;
   try
      // Atualiza o Vencimento mais atual na tabela OPERRENFIX
      AtuVencOper(qryOperAplicIDOPERRENFIX.AsInteger);

      //AL_3
      // Se a Nova vigencia é anterior a última fechamento
      // É necessário excluir os ATU posteriores
      if dbdDataVigencia.DateTime <= pRPI.DATAULTFECHRF then
      begin
         if MsgDlg('A Vigência a ser cadastrada é inferior à última abertura' + #13 +
                   'Este Título deverá ser reprocessado.' + #13 +
                   'Continua?', 'Mensagem do Sistema', mtConfirmation,[MbYes, MbNo],0) = mrNo then
         begin
            if dbdDataVigencia.CanFocus then
               dbdDataVigencia.SetFocus;
            Exit;
         end
         else
         begin
            dDataReproc := dbdDataVigencia.DateTime;
            if not CtrlInvContab.TestaPeriodo(DateToStr(dDataReproc),
                                              1, -1,
                                              qryOperAplicIDCLASSETIT.AsInteger) then
               Raise Exception.Create(CtrlInvContab.MessageInfo);

            if RendaFixa.MarcaInvRep(dDataReproc,
                                     qryOperAplicIDINVESTIMENTO.AsInteger,
                                     qryOperAplicIDOPERRENFIX.AsInteger,
                                     qryOperAplicIDPLANPREVCTBPATR.AsInteger) = -1 then
               Raise Exception.Create('Não foi Possível Marcar este Título para Reprocessamento.' + #13 +
                                      'o Título ' + qryOperAplicDESCINVESTIMENTO.AsString +
                                      ' deve ser Reprocessado desde o Dia ' + DateToStr(dDataReproc));
         end;
      end;

      // Atualiza o Histórico com o Vencimento ATU anterior sendo o Vencimento ANT do próximo
      qry.Last;
      dDataVenc := qryDATAVENCTOATU.AsDateTime;
      qry.Prior;
      repeat
         qry.Edit;
         qryDATAVENCTOANT.AsDateTime := dDataVenc;
         qry.Post;
         dDataVenc := qryDATAVENCTOATU.AsDateTime;
         qry.Prior;
      until qry.Bof;
      qry.ApplyUpdates;
      qry.CommitUpdates;

      if DtmBaseDados.dbBaseDados.InTransaction Then
         DtmBaseDados.dbBaseDados.Commit;
      //AL_3
      bbtnCancelarClick(Self);

      Sel(qryOperAplicIDOPERRENFIX.AsInteger);
   except
      //AL_3
      on E:Exception do
      begin
         MsgDlg('Não foi Possível Repactuar o Investimento. ' + #13 +
                 E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);

         if DtmBaseDados.dbBaseDados.InTransaction Then
            DtmBaseDados.dbBaseDados.RollBack;
         bbtnCancelarClick(Self);
      end;
   end;
end;

function TFrmCadRepacVenc.AtuVencOper(iOper: Integer): Boolean;
begin
   try
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('UPDATE OPERRENFIX ');
      qryAux.SQL.Add('SET VENCOPERACAO = ');
      qryAux.SQL.Add('    (SELECT MAX(DATAVENCTOATU) ');
      qryAux.SQL.Add('     FROM HISTOPERRENFIX ');
      qryAux.SQL.Add('     WHERE IDOPERRENFIX = ' + IntToStr(iOper) + ' ');
      qryAux.SQL.Add('       AND DATAVIGENCIA = (SELECT MAX(DATAVIGENCIA) AS DATAVIGENCIA ');
      qryAux.SQL.Add('                           FROM HISTOPERRENFIX ');
      qryAux.SQL.Add('                           WHERE IDOPERRENFIX = ' + IntToStr(iOper) + ')) ');
      qryAux.SQL.Add('WHERE IDOPERRENFIX = ' + IntToStr(iOper) + ' ');
      qryAux.ExecSQL;
      qryAux.SQL.Clear;
      // AL_2
      Result := True;
   except
      Result := False;
   end;
end;

procedure TFrmCadRepacVenc.sbtnApagarClick(Sender: TObject);
var sAcao: String;
    dDataVigencia, dDataAtu, dDataAnt: TDateTime;
begin
   if (qryDATAVENCTOANT.AsDateTime = qryDATAVENCTOATU.AsDateTime) and
      (qryDATAVIGENCIA.AsDateTime = qryOperAplicDATAOPERACAO.AsDateTime) then
      MsgDlg('Não é possível excluir o Vencimento Original da operação',
             'Mensagem do Sistema', mtInformation, [mbOk], 0)
   else
   begin
      try
         dDataVigencia := qryDATAVIGENCIA.AsDateTime;
         dDataAtu      := qryDATAVENCTOATU.AsDateTime;
         dDataAnt      := qryDATAVENCTOANT.AsDateTime;
         sAcao := 'Não foi possível excluir a repactuação';

         //AL_3
         if not CtrlInvContab.TestaPeriodo(DateToStr(qryDATAVENCTOATU.AsDateTime),
                                           1, -1,
                                           qryOperAplicIDCLASSETIT.AsInteger) then
            Raise Exception.Create(CtrlInvContab.MessageInfo);

         inherited;

         // Se não excluiu o Registro, Não faz nada
         if (qryDATAVIGENCIA.AsDateTime = dDataVigencia) and
            (qryDATAVENCTOATU.AsDateTime = dDataAtu) and
            (qryDATAVENCTOANT.AsDateTime = dDataAnt) then
            Exit;

         if not DtmBaseDados.dbBaseDados.InTransaction Then
            DtmBaseDados.dbBaseDados.StartTransaction;

         sAcao := 'Não foi possível reorganizar as datas de vencimento. ' + #13 +
                  'Verifique se o Vencimento Atual da Repactuação anterior é o' + #13 +
                  'o Vencimento Anterior da Repactuação seguinte';
         AtuVencOper(qryOperAplicIDOPERRENFIX.AsInteger);
         Sel(qryOperAplicIDOPERRENFIX.AsInteger);

         sAcao := 'Não foi possível marcar o título para reprocessamento';
         // Se o Vencimento Atual é passado, reprocessa
         qry.First;
         if qryDATAVENCTOATU.AsDateTime < pRPI.DATAULTFECHRF then
         begin
            if (dDataReproc > qryDATAVENCTOATU.AsDateTime) or (dDataReproc = 0) then
               dDataReproc := qryDATAVENCTOATU.AsDateTime;
         end;

         // Se precisar reprocessar, Marca o Investimento
         if dDataReproc <> 0 then
         begin
            //AL_3
            if not CtrlInvContab.TestaPeriodo(DateToStr(dDataReproc),
                                              1, -1,
                                              qryOperAplicIDCLASSETIT.AsInteger) then
               Raise Exception.Create(CtrlInvContab.MessageInfo);


            if RendaFixa.MarcaInvRep(dDataReproc,
                                     qryOperAplicIDINVESTIMENTO.AsInteger,
                                     qryOperAplicIDOPERRENFIX.AsInteger,
                                     qryOperAplicIDPLANPREVCTBPATR.AsInteger) = -1 then
            begin
               Raise Exception.Create('Não foi Possível Marcar este Título para Reprocessamento.' + #13 +
                                      'o Título ' + qryOperAplicDESCINVESTIMENTO.AsString +
                                      ' deve ser Reprocessado desde o Dia ' + DateToStr(dDataReproc));
            end;
         end;
         if DtmBaseDados.dbBaseDados.InTransaction Then
            DtmBaseDados.dbBaseDados.Commit;
      except
         //AL_3
         on E:Exception do
         begin
            MsgDlg('Não foi Possível excluir a Repactuar do Investimento. ' + #13 +
                 E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
            if DtmBaseDados.dbBaseDados.InTransaction Then
               DtmBaseDados.dbBaseDados.RollBack;
         end;
      end;
   end;
   CmeCadastro.AtualizaBotoes(Self);
end;

procedure TFrmCadRepacVenc.sbtnAlterarClick(Sender: TObject);
begin
   if (qryDATAVENCTOANT.AsDateTime = qryDATAVENCTOATU.AsDateTime) and
      (qryDATAVIGENCIA.AsDateTime = qryOperAplicDATAOPERACAO.AsDateTime) then
   begin
      MsgDlg('Não é possível alterar o Vencimento Original da operação',
             'Mensagem do Sistema', mtInformation, [mbOk], 0);
      CmeCadastro.AtualizaBotoes(Self);
   end
   else
      inherited;
end;

procedure TFrmCadRepacVenc.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  dDataReproc := 0;
end;

end.
