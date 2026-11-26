// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Nº SIG.....: SIG TIBERO
// Data.......: 02/03/2018
// Responsável: Everson Luiz Pereira da Cunha
// Descrição..: Melhoria no Planus para adequação ao TIBERO.
//              Inclusão de alias nas tabelas e campos.
//              Retirar INDEX, +rule etc
//------------------------------------------------------------------------------
// Autor(a)  : Fernando Xavier
// Data      : 14/04/2011
// Pendencia : 141073/3661  KINTANA 1128912
// Alteração : Ajuste no controle de transações no Banco de Dados
//------------------------------------------------------------------------------
// Autor(a)  : Hugo Luna
// Data      : 18/10/2007
// Pendencia : 26560
// Alteração : Acrescentando condição na qryDet para de acordo com o parâmetro prmFLAGCONTROLERUB,
//             adicionar ou não condição na qryDet.
//------------------------------------------------------------------------------
// Autor(a)  : Paulo Ramos
// Rotina    : EfetivaRubricas
// Data      : 30/06/2006
// Pendencia : 22678
// Alteração : Permitir cadastrar rubricas também para plano/patrocinadora anterior,
//             nos casos quando o participante é transferido de plano/patrocinadora.
//             Retirado da propriedade FILTRO do componente MONTASELECT
//             PARTPREVPLAN.FLGDESATIVADO = 0
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 09.10.2003
// Alteração   : Acrescentei os campos SALPARTICIPACAO E SALMANTIDO na tela
//               e atualizacao automatica desses campos
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 25.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 03/01/2003
// Alteração   : Acrescentado o campo chave SEQRUBRICA
// *****************************************************************************
// Autor(a)    : Augusto
// Data        : 11/12/2002
// Alteração   : Acrescentado todos os campos chaves do delete do updDet
// *****************************************************************************
// Autor(a)    : Gleyber
// Data        : 09/12/2002
// Alteração   : Corrigi o updateSql da qryDet (IDPATRO)
// *****************************************************************************
// Autor(a)    : Leo
// Data        : 23/10/2002
// Alteração   : coloquei o IDPLANOPREV nas atualizações
// *****************************************************************************
// Autor(a)    : Leo
// Data        : 04/10/2002
// Alteração   : recoloquei o idpessjur no string de update do updDet
// *****************************************************************************
// Autor(a)    : Gleyber
// Data        : 21/08/2002
// Alteração   : - Mostrar no GRID o código externo da rubrica.
//               - Mostrar no GRID o sequencial da rubrica e no alterar também
//               - Formatar valores com casas decimais
//               Pendência: 6813
// *****************************************************************************

unit FCadRubricaManualCS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask,
  DBCtrls, wwdblook, wwdbedit, CmEventosCadastro, ImgList;

type
  TfrmCadRubricaManualCS = class(TfrmCadMestreDetalheCS)
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    qryProvDesc: TwwQuery;
    grpMesAnoRef: TGroupBox;
    Label6: TLabel;
    edAnoRef: TEdit;
    edMesRef: TEdit;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    edAnoCob: TEdit;
    edMesCob: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    dbrgrpFlgSRB: TDBRadioGroup;
    qryDetIDPESSOA: TFloatField;
    qryDetIDPESSJUR: TFloatField;
    qryDetIDMOTIVO: TFloatField;
    qryDetMES: TStringField;
    qryDetMESCOBRANCA: TStringField;
    qryDetREFERENCIA: TStringField;
    qryDetIDRUBRICA: TFloatField;
    qryDetVALORPROVENTO: TFloatField;
    qryDetFLGCOMPOESALPART: TFloatField;
    qryDetFLGCOMPOESALBENEF: TFloatField;
    qryDetFLGIRRF: TFloatField;
    qryDetSEQRUBRICA: TFloatField;
    qryDetFLGSRB: TFloatField;
    dblkpcmbRubrica: TwwDBLookupCombo;
    qryauxrubrica: TwwQuery;
    qryDetCODPROVDESC: TStringField;
    redValor: TMaskEdit;
    qryDetDESCRICAO: TStringField;
    qryDetDESCFLGSRB: TStringField;
    Label10: TLabel;
    redIntegral: TMaskEdit;
    qryDetVALORINTEGRAL: TFloatField;
    grbSeq: TGroupBox;
    edSeqRub: TEdit;
    qryDetIDMODULO: TFloatField;
    qryDetIDPLANOPREV: TFloatField;
    qryDetIDGRUPORUBRICA: TStringField;
    qryDetIDPATRO: TFloatField;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    qryAux: TwwQuery;
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edMesRefChange(Sender: TObject);
    procedure edAnoRefChange(Sender: TObject);
    procedure edMesRefExit(Sender: TObject);
    procedure edAnoCobChange(Sender: TObject);
    procedure edMesCobExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure Subtrai;
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure qryDetAfterInsert(DataSet: TDataSet);
    procedure qryDetBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadRubricaManualCS: TfrmCadRubricaManualCS;
  rValor : Double;
  sIdPessoa, sIdPessJur, sSQL : string;

implementation

uses DBaseDados, UAdmPrev, UMensErro, UDataBase, USistema, UParticipante;

{$R *.DFM}

procedure TfrmCadRubricaManualCS.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')
  then begin
     sIdPessoa := MontaSelect.ValoresChave[0];
     sIdPessJur := MontaSelect.ValoresChave[1];
     sIdPlanoPrev := MontaSelect.ValoresChave[2];
     qry.Close;
     qry.ParamByName('IdPessoa').Value  := StrToInt(sIdPessoa);
     qry.ParamByName('IdPessJur').Value := StrToInt(sIdPessJur);
     qry.ParamByName('IdPlanoPrev').Value := StrToInt(sIdPlanoPrev);

     qry.Open;

     qryDet.Close;
     qryDet.SQL.Clear;
     qryDet.SQL.Add(sSQL);
     qryDet.ParamByName('IdPessoa').Value  := StrToInt(sIdPessoa);
     qryDet.ParamByName('IdPessJur').Value := StrToInt(sIdPessJur);
     qryDet.Open;

     qryProvDesc.Close;
     qryProvDesc.ParamByName('IdPessoa').Value := StrToInt(sIdPessJur);
     qryProvDesc.Open;

     qryAuxRubrica.Close;
     qryAuxRubrica.ParamByName('IdPessJur').Value := StrToInt(sIdPessJur);
     qryAuxRubrica.Open;

  end;
end;

procedure TfrmCadRubricaManualCS.CmeDetalheInsert(Sender: TObject);
begin
  inherited;

  dblkpcmbRubrica.Clear;

  edSeqRub.Text    := '';

  edAnoRef.SetFocus;
  //
end;

procedure TfrmCadRubricaManualCS.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  edAnoRef.Text    := Copy(qryDet.FieldByName('Mes').AsString,1,4);
  edMesRef.Text    := Copy(qryDet.FieldByName('Mes').AsString,6,2);
  edAnoCob.Text    := Copy(qryDet.FieldByName('MesCobranca').AsString,1,4);
  edMesCob.Text    := Copy(qryDet.FieldByName('MesCobranca').AsString,6,2);
  redValor.Text    := FloattoStr(qryDet.FieldByName('VALORPROVENTO').AsFloat);
  redIntegral.Text := FloattoStr(qryDet.FieldByName('VALORINTEGRAL').AsFloat);
  edSeqRub.Text    := qrydet.FieldByName('SEQRUBRICA').AsString;

  edAnoRef.SetFocus;

end; // CmeDetalhe.Edit(Self)

procedure TfrmCadRubricaManualCS.CmeCadastroConfirma(Sender: TObject);
var sSalarioPartPrevPlan : string;
    sSalarioHistorico    : string;
    sUltimoMes           : string;
begin
   inherited;
   try
      AplicaAlteracoes([qryDet]);
      qryDet.Close;
      qryDet.Open;
   except
      raise;
   end;
   // Adicionando Log Padrao
   Try
     If Not Sistema.GravaLogOperacoes(Self.Caption)
     Then raise exception.Create('Erro ao gravar Log.')
   Except
   End;

   // VERIFICAR SE O ULTIMO SALARIO DE PARTICIPACAO É IGUAL AO SALPARTICIPACAO DA PARTPREVPLAN
   if qryAuxRubrica.FieldByName('IDRUBSALPARTICIP').AsInteger > 0
   then begin
      sSalarioPartPrevPlan := BuscaSalarioAtual( qry.FieldByName('IDPESSJUR').AsInteger,
                                                 qry.FieldByName('IDPLANOPREV').AsInteger,
                                                 qry.FieldByName('IDPESSOA').AsInteger,
                                                 qryAux);
      with qryAux do
      begin
         Close;
         SQL.Clear;
//         SQL.Add(' SELECT /*+ RULE */ MAX(MES) AS MES  '+  //Everson TIBERO
         SQL.Add(' SELECT MAX(MES) AS MES  '+                //Everson TIBERO
                 ' FROM   HISTRUBSAL    '+
                 ' WHERE  IDPESSJUR = '+qry.FieldByName('IDPESSJUR').AsString+
                 ' AND    IDPESSOA  = '+qry.FieldByName('IDPESSOA').AsString+
                 ' AND    IDRUBRICA = '+qryAuxRubrica.FieldByName('IDRUBSALPARTICIP').AsString);
         Open;
         if (not IsEmpty) and (FieldByName('MES').AsString <> '')
         then sUltimoMes := FieldByName('MES').AsString
         else sUltimoMes := '0000/00';

         Close;
         SQL.Clear;
//         SQL.Add(' SELECT /*+ RULE */ VALORPROVENTO '+ //Everson TIBERO
         SQL.Add(' SELECT VALORPROVENTO '+               //Everson TIBERO
                 ' FROM   HISTRUBSAL    '+
                 ' WHERE  IDPESSJUR = '+qry.FieldByName('IDPESSJUR').AsString+
                 ' AND    IDPESSOA  = '+qry.FieldByName('IDPESSOA').AsString+
                 ' AND    IDRUBRICA = '+qryAuxRubrica.FieldByName('IDRUBSALPARTICIP').AsString+
                 ' AND    MES       = '''+sUltimoMes+'''');
         Open;
         if (not IsEmpty) and (FieldByName('ValorProvento').AsFloat > 0)
         then sSalarioHistorico := FieldByName('ValorProvento').AsString
         else sSalarioHistorico := '0';
      end;

      if (sUltimoMes <> '0000/00') and
         (Abs(StrToFloat(ClienteNumero(sSalarioHistorico)) - StrToFloat(ClienteNumero(sSalarioPartPrevPlan))) > 0.01)
      then begin
         if MsgDlg('O Último Salário de Participação não está de acordo com o salário do último mês do histórico ('+sUltimoMes+').'+#13+
                   'Deseja atualizar o campo "Último Salário de Participação" ? ', 'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes
         then begin
            dtmBaseDados.dbBaseDados.StartTransaction;
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE PARTPREVPLAN SET SALPARTICIPACAO = '+OraNumero(sSalarioHistorico)+
                           ' WHERE  IDPESSJUR   = '+qry.FieldByName('IDPESSJUR').AsString+
                           ' AND    IDPLANOPREV = '+qry.FieldByName('IDPLANOPREV').AsString+
                           ' AND    IDPESSOA    = '+qry.FieldByName('IDPESSOA').AsString+
                           ' AND    SEQPROPOSTA = '+qry.FieldByName('SEQPROPOSTA').AsString);
            try
               qryAux.ExecSQL;
            except
               dtmBaseDados.dbBaseDados.RollBack;
               MsgDlg('Erro ao atualizar salário de participação.','Erro',mtError,[mbOk],0);
               Exit;
            end;
            dtmBaseDados.dbBaseDados.Commit;
            MsgDlg('Salário de Participação atualizado com sucesso.','Informação',mtInformation,[mbOk],0);
         end;
      end;
   end;
   // VERIFICAR SE O ULTIMO SALARIO DE MANUTENÇÃO É IGUAL AO SALMANTIDO DA PARTPREVPLAN
   if qryAuxRubrica.FieldByName('IDRUBSALMANUT').AsInteger > 0
   then begin
      sSalarioPartPrevPlan := BuscaSalarioAtual( qry.FieldByName('IDPESSJUR').AsInteger,
                                                 qry.FieldByName('IDPLANOPREV').AsInteger,
                                                 qry.FieldByName('IDPESSOA').AsInteger,
                                                 qryAux, 'MA');
      with qryAux do
      begin
         Close;
         SQL.Clear;
//         SQL.Add(' SELECT /*+ RULE */ MAX(MES) AS MES  '+ //Everson TIBERO
         SQL.Add(' SELECT MAX(MES) AS MES  '+               //Everson TIBERO
                 ' FROM   HISTRUBSAL    '+
                 ' WHERE  IDPESSJUR = '+qry.FieldByName('IDPESSJUR').AsString+
                 ' AND    IDPESSOA  = '+qry.FieldByName('IDPESSOA').AsString+
                 ' AND    IDRUBRICA = '+qryAuxRubrica.FieldByName('IDRUBSALMANUT').AsString);
         Open;
         if (not IsEmpty) and (FieldByName('MES').AsString <> '')
         then sUltimoMes := FieldByName('MES').AsString
         else sUltimoMes := '0000/00';

         Close;
         SQL.Clear;
//       SQL.Add(' SELECT /*+ RULE */ VALORPROVENTO '+ //Everson TIBERO
         SQL.Add(' SELECT VALORPROVENTO '+ //Everson TIBERO
                 ' FROM   HISTRUBSAL    '+
                 ' WHERE  IDPESSJUR = '+qry.FieldByName('IDPESSJUR').AsString+
                 ' AND    IDPESSOA  = '+qry.FieldByName('IDPESSOA').AsString+
                 ' AND    IDRUBRICA = '+qryAuxRubrica.FieldByName('IDRUBSALMANUT').AsString+
                 ' AND    MES       = '''+sUltimoMes+'''');
         Open;
         if (not IsEmpty) and (FieldByName('ValorProvento').AsFloat > 0)
         then sSalarioHistorico := FieldByName('ValorProvento').AsString
         else sSalarioHistorico := '0';
      end;

      if (sUltimoMes <> '0000/00') and
         (Abs(StrToFloat(ClienteNumero(sSalarioHistorico)) - StrToFloat(ClienteNumero(sSalarioPartPrevPlan))) > 0.01)
      then begin
         if MsgDlg('O Último Salário de Manutenção não está de acordo com o salário do último mês do histórico ('+sUltimoMes+').'+#13+
                   'Deseja atualizar o campo "Último Salário de Manutenção" ? ', 'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes
         then begin
            dtmBaseDados.dbBaseDados.StartTransaction;
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE PARTPREVPLAN SET SALMANTIDO = '+OraNumero(sSalarioHistorico)+
                           ' WHERE  IDPESSJUR   = '+qry.FieldByName('IDPESSJUR').AsString+
                           ' AND    IDPLANOPREV = '+qry.FieldByName('IDPLANOPREV').AsString+
                           ' AND    IDPESSOA    = '+qry.FieldByName('IDPESSOA').AsString+
                           ' AND    SEQPROPOSTA = '+qry.FieldByName('SEQPROPOSTA').AsString);
            try
               qryAux.ExecSQL;
            except
               dtmBaseDados.dbBaseDados.RollBack;
               MsgDlg('Erro ao atualizar salário de manutenção.','Erro',mtError,[mbOk],0);
               Exit;
            end;
            dtmBaseDados.dbBaseDados.Commit;
            MsgDlg('Salário de Manutenção atualizado com sucesso.','Informação',mtInformation,[mbOk],0);
         end;
      end;
   end;


end; // CmeCadastro.Confirma(Self)

procedure TfrmCadRubricaManualCS.CmeDetalheConfirma(Sender: TObject);
begin
   inherited;

end; // CmeDetalhe.Confirma(Self)


procedure TfrmCadRubricaManualCS.sbtnInserirClick(Sender: TObject);
begin
  MsgDlg('Esta tela permite apenas a inclusão de rubricas. Utilize o botão "Alterar". ','Atenção',mterror,[mbOK],0);
  sbtnInserir.Down := False;
  Abort;
  inherited;

end;

procedure TfrmCadRubricaManualCS.sbtnApagarClick(Sender: TObject);
begin
  MsgDlg('Esta tela permite apenas a exclusão de rubricas. Utilize o botão "Alterar". ','Atenção',mterror,[mbOK],0);
  sbtnApagar.Down := False;
  Abort;
  inherited;
end;

procedure TfrmCadRubricaManualCS.FormActivate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('IdPessoa').Value  := 0;
  qry.ParamByName('IdPessJur').Value := 0;
  qry.Open;

  qryDet.Close;
  qryDet.SQL.Clear;
  qryDet.SQL.Add(sSQL);
  qryDet.ParamByName('IdPessoa').Value  := 0;
  qryDet.ParamByName('IdPessJur').Value := 0;
  qryDet.Open;

  qryProvDesc.Close;
  qryProvDesc.ParamByName('IdPessoa').Value := 0;
  qryProvDesc.Open;
end;

procedure TfrmCadRubricaManualCS.FormShow(Sender: TObject);
begin
  inherited;
  edAnoRef.Text := '';
  edMesRef.Text := '';
  edAnoCob.Text := '';
  edMesCob.Text := '';
  rValor        := 0;
  MontaSelect.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');
end;

procedure TfrmCadRubricaManualCS.bbtnOkDetClick(Sender: TObject);
begin
  rvalor := StrtoFloat(ClienteNumero(redValor.Text));
  // Verificar dados obrigatorios
  if Trim(edAnoRef.Text) = ''
  then begin
     MsgDlg('Preencha o Ano de Referência.','Atenção',mterror,[mbOK],0);
     Exit;
  end;

  if Trim(edMesRef.Text) = ''
  then begin
     MsgDlg('Preencha o Mês de Referência.','Atenção',mterror,[mbOK],0);
     Exit;
  end;

  if Trim(edAnoCob.Text) = ''
  then begin
     MsgDlg('Preencha o Ano de Cobrança / Pagamento.','Atenção',mterror,[mbOK],0);
     Exit;
  end;

  if Trim(edMesCob.Text) = ''
  then begin
     MsgDlg('Preencha o Mês de Cobrança.','Atenção',mterror,[mbOK],0);
     Exit;
  end;

  if Trim(dblkpcmbRubrica.Text) = ''
  then begin
     MsgDlg('Preencha a Rubrica.','Atenção',mterror,[mbOK],0);
     Exit;
  end;

  if Trim(redValor.Text) = ''
  then begin
     MsgDlg('Preencha o Valor da Rubrica.','Atenção',mterror,[mbOK],0);
     Exit;
  end;

  // Verificar motivo
  if qryDet.state = dsinsert then
  begin
     if prmIdMotivoContrib <= 0 then
     begin
       MsgDlg('O Parâmetro -> Motivo Padrão de Contribuição deve ser cadastrado !','Atenção',mterror,[mbOK],0);
       Exit;
     end;
  end;

  // só apresentar a rubrica de salário de participação se não tiver nenhuma já escolhida
  if (qryAuxRubrica.fieldbyname('IDRUBSALPARTICIP').AsString <> '') and (rValor = 0)
  then begin
     qryprovdesc.Locate('IDRUBRICA',qryauxrubrica.fieldbyname('IDRUBSALPARTICIP').AsInteger,[locaseinsensitive]);
     dblkpcmbRubrica.text :=  qryprovdesc.fieldbyname('DESCRPROVDESC').AsString;
  end;

  inherited;

end;

procedure TfrmCadRubricaManualCS.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  rValor := 0;
  qryDet.Close;
  qryDet.SQL.Clear;
  qryDet.SQL.Add(sSQL);
  qryDet.ParamByName('IdPessoa').Value  := StrToInt(sIdPessoa);
  qryDet.ParamByName('IdPessJur').Value := StrToInt(sIdPessJur);
  qryDet.Open;
end;

procedure TfrmCadRubricaManualCS.edMesRefChange(Sender: TObject);
begin
  inherited;
  if length(edMesRef.Text) = 2 Then  
     edAnoCob.SetFocus;
end;

procedure TfrmCadRubricaManualCS.edAnoRefChange(Sender: TObject);
begin
  inherited;
  if length(edAnoRef.Text) = 4 Then  
     edMesRef.SetFocus;
end;

procedure TfrmCadRubricaManualCS.edMesRefExit(Sender: TObject);
begin
  inherited;
  if (edMesRef.Text <> '') and ((StrtoInt(edMesRef.Text) > 13) or (StrtoInt(edMesRef.Text) <= 0)) Then Begin
     MsgDlg('Mês inválido','Atenção',mterror,[mbOK],0);
     edMesRef.SetFocus;
  end;
end;

procedure TfrmCadRubricaManualCS.edAnoCobChange(Sender: TObject);
begin
  inherited;
  if length(edAnoCob.Text) = 4 Then
     edMesCob.SetFocus;
end;

procedure TfrmCadRubricaManualCS.edMesCobExit(Sender: TObject);
begin
  inherited;
  if (edMesCob.Text <> '') and ((StrtoInt(edMesCob.Text) > 12) or (StrtoInt(edMesCob.Text) <= 0)) Then Begin
     MsgDlg('Mês inválido','Atenção',mterror,[mbOK],0);
     edMesCob.SetFocus;
  end;
end;

procedure TfrmCadRubricaManualCS.FormCreate(Sender: TObject);
begin
  inherited;
  sbtnInserir.Visible := false;  
  sbtnApagar.Visible := false;   

  sSQL:= ' SELECT H.IDPATRO,    '+
         ' H.IDPESSOA,          '+
         ' H.IDPESSJUR,         '+
         ' H.IDMOTIVO,          '+
         ' H.MES,               '+
         ' H.MESCOBRANCA,       '+
         ' H.REFERENCIA,        '+
         ' H.IDRUBRICA,         '+
         ' H.CODPROVDESC,       '+
         ' H.IDMODULO,          '+
         ' H.VALORPROVENTO,     '+
         ' H.VALORINTEGRAL,     '+
         ' H.FLGCOMPOESALPART,  '+
         ' H.FLGCOMPOESALBENEF, '+
         ' H.FLGIRRF,           '+
         ' H.SEQRUBRICA,        '+
         ' C.DESCRICAO,         '+
         ' H.FLGSRB,            '+
         ' C.IDGRUPORUBRICA,    '+
         ' DECODE(H.FLGSRB,     '+
         '     1, ''Ativo ou Mantido Total'', '+
         '     2, ''Aux. Doença'', '+
         '     3, ''INSS'',        '+
         '     4, ''Sal. Virtual'','+
         '     5, ''Mantido Parcial'', '+
         '     0, ''Outros'') AS DescFLGSRB, '+
//         ' IDPLANOPREV          '+ //Everson TIBERO
         ' H.IDPLANOPREV          '+ //Everson TIBERO
         ' FROM HISTRUBSAL H, PROVDESC C   '+
         ' WHERE (H.IDPESSOA = :IDPESSOA) '+
         ' AND (H.IDPESSJUR = :IDPESSJUR) '+
         ' AND (H.IDRUBRICA = C.IDPROVENTO)';

         if prmFLGCONTROLERUB = 1 then
           sSQL:= sSQL +' AND (NVL(H.IDMODULO,0) <> 21)     ';

//         sSQL:= sSQL +' ORDER BY MES DESC, MESCOBRANCA DESC, CODPROVDESC, H.VALORPROVENTO DESC ';     //Everson TIBERO
         sSQL:= sSQL +' ORDER BY H.MES DESC, H.MESCOBRANCA DESC, C.CODPROVDESC, H.VALORPROVENTO DESC '; //Everson TIBERO
end;

procedure TfrmCadRubricaManualCS.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  edAnoRef.Text    := '';
  edMesRef.Text    := '';
  edAnoCob.Text    := '';
  edMesCob.Text    := '';

  redValor.Text    := '';
  redIntegral.Text := '';
//
  edAnoRef.SetFocus;
end;

procedure TfrmCadRubricaManualCS.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  edAnoRef.SetFocus;
end;

procedure TfrmCadRubricaManualCS.Subtrai;
begin
  // Subtrair mes / ano ao anterior
  if (Trim(edAnoRef.Text) <> '') and (Trim(edMesRef.Text) <> '')
  then begin
     if StrToInt(Trim(edMesRef.Text)) = 01
     then begin
        edAnoRef.Text := IntToStr( StrToInt(edAnoRef.Text) - 1);
        edMesRef.Text := '12';
     end
     else begin
        edMesRef.Text := IntToStr( StrToInt(edMesRef.Text) - 1);
        if StrToInt(edMesRef.Text) <= 9
        then edMesRef.Text := '0'+edMesRef.Text;
     end;
     redValor.SetFocus;
  end;

  if (Trim(edAnoCob.Text) <> '') and (Trim(edMesCob.Text) <> '')
  then begin
     if StrToInt(Trim(edMesCob.Text)) = 01
     then begin
        edAnoCob.Text := IntToStr( StrToInt(edAnoCob.Text) - 1);
        edMesCob.Text := '12';
     end
     else begin
        edMesCob.Text := IntToStr( StrToInt(edMesCob.Text) - 1);
        if StrToInt(edMesCob.Text) <= 9
        then edMesCob.Text := '0'+edMesCob.Text;
     end;
     redValor.SetFocus;
  end;
end;

procedure TfrmCadRubricaManualCS.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
//  Subtrai;
  dbgrdDet.Refresh;
end;

procedure TfrmCadRubricaManualCS.qryDetAfterInsert(DataSet: TDataSet);
var sAnoMesReferencia,sAnoReferencia,sMesReferencia,
    sAnoMesCobranca,sAnoCobranca,sMesCobranca : string;
begin
  dbrgrpFlgSRB.ItemIndex := 0;

end;

procedure TfrmCadRubricaManualCS.qryDetBeforePost(DataSet: TDataSet);
var sAnoMesReferencia,sAnoReferencia,sMesReferencia,
    sAnoMesCobranca,sAnoCobranca,sMesCobranca : string;
begin
  inherited;
   // Fernando xavier 141073/3661  KINTANA 1128912
   Upd.ModifySQL.Clear;
   if qry.state in [DsEdit] then
      qry.CancelUpdates;
   // fernando Xavier  141073/3661  KINTANA 1128912  
  if trim(edAnoRef.Text) <> '' then
  begin
  sAnoReferencia := Trim(edAnoRef.Text);
  if (StrToInt(Trim(edMesRef.Text))  <= 8) and
     (Length(Trim(edMesRef.Text)) = 1)
  then sMesReferencia := '0'+Trim(edMesRef.Text)
  else sMesReferencia := Trim(edMesRef.Text);
  sAnoMesReferencia   := Trim(edAnoRef.Text)+'/'+sMesReferencia;
  end;


  if trim(edAnoCob.Text) <> '' then
  begin
  sAnoCobranca := Trim(edAnoCob.Text);
  if (StrToInt(Trim(edMesCob.Text))  <= 8) and
     (Length(Trim(edMesCob.Text)) = 1)
  then sMesCobranca := '0'+Trim(edMesCob.Text)
  else sMesCobranca := Trim(edMesCob.Text);
  sAnoMesCobranca   := sAnoCobranca+'/'+sMesCobranca;
  end;

  if qryDet.State = dsInsert then
  begin
     qryDet.FieldByName('IdPessoa').AsInteger  := qry.FieldByName('IdPessoa').AsInteger;
     qryDet.FieldByName('IdPessJur').AsInteger := qry.FieldByName('IdPessJur').AsInteger;
     qryDet.FieldByName('IdPlanoPrev').AsInteger := qry.FieldByName('IdPlanoPrev').AsInteger;
     qryDet.FieldByName('IdMotivo').AsInteger  := prmIdMotivoContrib;
     qryDet.FieldByName('IdRubrica').AsInteger := qryProvDesc.FieldbyName('IdRubrica').AsInteger;
     qryDet.FieldByName('IDMODULO').AsInteger  := Sistema.IdModulo; 
  end;
                        
  if qryDet.FieldByName('IDMODULO').AsString = ''
  then qryDet.FieldByName('IDMODULO').AsInteger  := Sistema.IdModulo; 

  qryDet.FieldByName('MES').AsString                := sAnoMesReferencia;
  qryDet.FieldByName('MESCOBRANCA').AsString        := sAnoMesCobranca;
  qryDet.FieldByName('CODPROVDESC').AsString        := qryProvDesc.FieldByName('CodProvDesc').AsString;
  qryDet.FieldByName('FLGCOMPOESALPART').AsInteger  := qryProvDesc.FieldByName('flgCompoeSalPart').AsInteger;
  qryDet.FieldByName('FLGCOMPOESALBENEF').AsInteger := qryProvDesc.FieldByName('flgCompoeSalBenef').AsInteger;
  qryDet.FieldByName('FLGIRRF').AsInteger           := qryProvDesc.FieldByName('flgIRRF').AsInteger;
  qryDet.FieldByName('REFERENCIA').AsString         := '***';
  qryDet.FieldByName('SEQRUBRICA').AsInteger        := 1;
  qryDet.FieldByName('VALORPROVENTO').AsFloat       := StrtoFloat(redValor.text);

  qryDet.FieldByName('IDPATRO').AsInteger           := qry.FieldByName('IDPESSJUR').AsInteger;

  if Trim(redIntegral.Text) <> ''
  then qryDet.FieldByName('VALORINTEGRAL').AsFloat  := StrtoFloat(redIntegral.text)
  else qryDet.FieldByName('VALORINTEGRAL').AsFloat  := StrtoFloat(redValor.text);

  qryDet.FieldByName('DESCRICAO').AsString          := qryProvDesc.FieldByName('DESCRPROVDESC').AsString;

end;

end.
