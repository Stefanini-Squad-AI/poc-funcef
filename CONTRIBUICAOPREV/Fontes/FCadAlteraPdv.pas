// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 21.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FCadAlteraPdv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, URegra, MontaSelect, Db, DBTables, Wwquery, wwdblook,
  Buttons, UConsPart, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  TB97Tlbr, TB97, wwdbdatetimepicker, CMDateTimePicker, ExtCtrls ;

type
  TfrmCadAlteraPdv = class(TfrmOkCancelar)
    lblValores: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    lblPatro: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    edNome: TEdit;
    edPatro: TEdit;
    edMatricula: TEdit;
    edPlano: TEdit;
    Panel3: TPanel;
    ConsPart1: TConsPart;
    bbtnProcurar: TBitBtn;
    bbtnOpcoes: TBitBtn;
    Panel5: TPanel;
    Label1: TLabel;
    lblSitPatro: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    edInscNumero: TEdit;
    edSitPatro: TEdit;
    edSitPlano: TEdit;
    edSitFundacao: TEdit;
    Panel1: TPanel;
    lblBeneficio: TLabel;
    edBeneficio: TEdit;
    Panel4: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    edEventoPdv: TEdit;
    dblkedBeneficio: TwwDBLookupCombo;
    Label7: TLabel;
    dblkcmbEventoPdv: TwwDBLookupCombo;
    qryBenef: TwwQuery;
    qryEvento: TwwQuery;
    qryAux: TwwQuery;
    regCalculo: TRegra;
    Label9: TLabel;
    MontaSelectPart: TMontaSelect;
    dtEvento: TCMDateTimePicker;
    Label10: TLabel;
    Label11: TLabel;
    edDataEventoNova: TCMDateTimePicker;
    qryGrava: TwwQuery;

    procedure FormCreate(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);


  private // Private declarations

    sIdPessoa,    sIdPessJur, sIdPlanoPrev, sIdEventoGerador,
    sSeqProposta, sIdEventosPrev, sDataFinal, sIdRegraResgate : string;

    bMudouEvento, bMudouBeneficio : Boolean;

    procedure LimparTela;
    procedure AlteraManutencaoPdv;
    procedure AlteraBeneficio;
    procedure ExecutarRegra;


  public  // Public declarations

  end;



var
  frmCadAlteraPdv: TfrmCadAlteraPdv;



implementation
{$R *.DFM}
uses
  UDataBase, UMensErro, FTelaAut, DBaseDados, UModulo,
  UEventos,  UAdmPrev,  FAguarde, USistema;




procedure TfrmCadAlteraPdv.FormCreate(Sender: TObject);
begin
  inherited;
  qryEvento.Close;
  qryEvento.Open;

  qryBenef.Close;
  qryBenef.ParamByName('IDPLANOPREV').AsInteger := -1;
  qryBenef.Open;

  LimparTela;
end;



procedure TfrmCadAlteraPdv.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelectPart.Executar;
  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '') then
      begin
           sIdPessoa         := MontaSelectPart.ValoresChave[8];
           sIdPessJur        := MontaSelectPart.ValoresChave[9];
           sIdPlanoPrev      := MontaSelectPart.ValoresChave[10];
           sIdEventoGerador  := MontaSelectPart.ValoresChave[11];
           sSeqProposta      := MontaSelectPart.ValoresChave[15];
           sIdEventosPrev    := MontaSelectPart.ValoresChave[16];

           edNome.Text       := MontaSelectPart.ValoresChave[0];
           edPatro.Text      := MontaSelectPart.ValoresChave[1];
           edPlano.Text      := MontaSelectPart.ValoresChave[2];
           edEventoPdv.Text  := MontaSelectPart.ValoresChave[3];
           dtEvento.Text     := MontaSelectPart.ValoresChave[4];
           edSitPatro.Text   := MontaSelectPart.ValoresChave[5];
           edSitFundacao.Text:= MontaSelectPart.ValoresChave[6];
           edSitPlano.Text   := MontaSelectPart.ValoresChave[7];
           edMatricula.Text  := MontaSelectPart.ValoresChave[18];
           edInscNumero.Text := MontaSelectPart.ValoresChave[19];
           edBeneficio.Text  := MontaSelectPart.ValoresChave[20];

           edDataEventoNova.SetFocus;

           qryBenef.Close;
           qryBenef.ParamByName('IDPLANOPREV').AsString := sIdPlanoPrev;
           qryBenef.Open;

           dblkedBeneficio.Text  := edBeneficio.Text;
           dblkcmbEventoPdv.Text := edEventoPdv.Text;

           dblkedBeneficio.PerformSearch;
           dblkcmbEventoPdv.PerformSearch;
      end;
end;



procedure TfrmCadAlteraPdv.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if edNome.Text = ''
  then begin
     MsgDlg('O Participante não foi selecionado.','Informação',mtInformation,[mbOk,mbHelp],0);
     bbtnProcurar.SetFocus;
     Exit;
  end;

  if (dblkedBeneficio.Text = '')
  then begin
     MsgDlg('O Benefício a requerer está em branco.','Informação',mtInformation,[mbOk,mbHelp],0);
     dblkedBeneficio.SetFocus;
     Exit;
  end;

  if (dblkcmbEventoPdv.Text = '')
  then begin
     MsgDlg('O Evento de Demissão não foi preenchido.','Informação',mtInformation,[mbOk,mbHelp],0);
     dblkcmbEventoPdv.SetFocus;
     Exit;
  end;

  bMudouEvento    := (dblkcmbEventoPdv.Text <> edEventoPdv.Text);
  bMudouBeneficio := (dblkedBeneficio.Text  <> edBeneficio.Text);

  if (not bMudouEvento) and (not bMudouBeneficio)
  then begin
       MsgDlg('Não existe alteração.','Informação',mtInformation,[mbOk,mbHelp],0);  
       Exit;
  end;

  sDataFinal      := '';
  ExecutarRegra;
  if sDataFinal    = '' then Exit;

  frmAguarde.Mostra('Processando atualização do Evento.');

  if (bMudouEvento)
  then AlteraManutencaoPdv
  else if (bMudouBeneficio)
       then AlteraBeneficio;

  frmAguarde.Apaga;
  LimparTela;
end;



procedure TfrmCadAlteraPdv.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  LimparTela;
end;



procedure TfrmCadAlteraPdv.LimparTela;
begin
    sIdPessoa        := '';
    sIdPessJur       := '';
    sIdPlanoPrev     := '';
    sIdEventoGerador := '';
    sSeqProposta     := '';

    edNome.Text       := '';
    edPatro.Text      := '';
    edPlano.Text      := '';
    edBeneficio.Text  := '';
    dtEvento.Text     := '';
    edSitPatro.Text   := '';
    edSitFundacao.Text:= '';
    edSitPlano.Text   := '';

    edMatricula.Text  := '';
    edInscNumero.Text := '';
    edEventoPdv.Text  := '';

    edDataEventoNova.Text := '';
    dblkedBeneficio.Text  := '';
    dblkcmbEventoPdv.Text := '';
end;



procedure TfrmCadAlteraPdv.ExecutarRegra;
var sMsgErro, sSQL : string;
    bErro : Boolean;
begin
   dblkedBeneficio.PerformSearch;
   dblkcmbEventoPdv.PerformSearch;

   sMsgErro := '';
   sSql  := ' SELECT DISTINCT EP.IDREGRADTFIMEV, EP.PRZMESESEVENT, EP.IDEVENTOGERADOR,  '+
            '        EP.IDREGRARESGATE, BP.IDREGRACALCULO, BP.IDBENEFICIO,      '+
            '        PF.DATANASC,       PF.SEXO, '+
            sIdPlanoPrev+' AS IDPLANOPREV, '+sIdPessoa +' AS IDPESSOA,  '+
            sSeqProposta+' AS SEQPROPOSTA, '+sIdPessJur+' AS IDPESSJUR, '+
            '        To_Date( '+''''+dtEvento.Text+''', ''dd/mm/yyyy'') as DATAEVENTO,  '+
            '        To_Date( '+''''+dtEvento.Text+''', ''dd/mm/yyyy'') as DATAEVENT    '+
            ' FROM   EVENTOSPLANO EP, BENEFPLANPREV BP, PESSOAFISICA PF '+
            ' WHERE  EP.IDEVENTOGERADOR = ' + qryEvento.FieldByName('IDEVENTOGERADOR').AsString + ' AND ' +
            '        EP.IDPLANOPREV     = ' + sIdPlanoPrev + ' AND '+
            '        PF.IDPESSOA        = ' + sIdPessoa    + ' AND '+
            '        EP.IDPLANOPREV     = BP.IDPLANOPREV       AND '+
            '        BP.IDBENEFICIO     = ' + qryBenef.FieldByName('IDBENEFICIO').AsString;
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add(sSQL);
   qryAux.Open;

   if (qryAux.IsEmpty)
   then begin
        MsgDlg('O Evento informado não foi cadastrado no Tipo de PDV','Antenção',mtWarning,[mbOk,mbHelp],0);
        qryAux.Close;
        Exit;
   end;

   sIdRegraResgate := qryAux.FieldByName('IDREGRARESGATE').AsString; 
   sMsgErro   := '';
   frmAguarde.Mostra('Regra de Data Final do PDV - Nº '+qryAux.FieldByName('IDREGRADTFIMEV').AsString);
   sDataFinal := ExecutaRegraDtFinalPDv(qryAux.FieldByName('IDREGRADTFIMEV').AsString,
                                        sSQL, sMsgErro);
   frmAguarde.Apaga;

   if sDataFinal  = ''
   then sMsgErro := 'A regra de data final retornou um valor em branco.';

   if (sMsgErro <> '')
   then begin
      MsgDlg(sMsgErro+#13+' Evento não efetuado.','Error',mtError,[mbOk,mbHelp],0);
      Exit;
   end;
end;



procedure TfrmCadAlteraPdv.AlteraManutencaoPdv;
var
   iIdAssociacao     : Integer;
   sIdEventosPrevAlt,
   sIdBeneficio      : string;
begin
   sIdEventosPrevAlt := IntToStr(LeUltRegistro(qryAux,'EVENTOSPREV'));

   dblkedBeneficio.PerformSearch;
   sIdBeneficio      := qryBenef.FieldByName('IDBENEFICIO').AsString;

   StartTransacao;
   with qryAux do
   begin
      //===== Insere Novo Evento
      Close;
      Sql.Clear;
      Sql.Add(' SELECT E.IDEVENTOSPREV,   E.IDSITPLANOATUAL, E.IDSITFUNCATUAL,  '+
              '        E.IDEVENTOGERADOR, E.IDPESSJUR,       E.IDSITPARTATUAL,  '+
              '        E.IDPLANOPREV,     E.IDPESSOA,        E.IDSITPLANONOVO,  '+
              '        E.IDSITPARTNOVO,   E.DATAREGISTRO,    E.DATAEVENTO,      '+
              '        E.FLGEFETIVADO,    E.DATAEFETIVADO,   E.DATAALTERADO,    '+
              '        E.DATAVOLTA,       E.FLGSITFUNCIMED,  E.IDSITFUNCNOVO,   '+
              '        E.FLGSITPARTIMED,  E.FLGSITPLANOIMED, E.SEQPROPOSTA,     '+
              '        E.FLGTPDEMISSAO,   BP.IDREGRACALCULO    '+
              ' FROM   EVENTOSPREV E,     BENEFPLANPREV BP  '+
              ' WHERE  E.IDEVENTOSPREV   = '+sIdEventosPrev +
              ' AND    E.IDPESSOA        = '+sIdPessoa+
              ' AND    E.IDPLANOPREV     = '+sIdPlanoPrev+
              ' AND    E.IDPESSJUR       = '+sIdPessJur+
              ' AND    E.SEQPROPOSTA     = '+sSeqProposta+
              ' AND    E.IDEVENTOGERADOR = '+sIdEventoGerador +
              ' AND    E.IDPLANOPREV   = BP.IDPLANOPREV '+
              ' AND    BP.IDBENEFICIO  = '+sIdBeneficio );
      Open;
      while not Eof do
      begin
          qryGrava.Close;
          qryGrava.Sql.Clear;
          qryGrava.Sql.Add(' INSERT INTO EVENTOSPREV '+
                           '(IDEVENTOSPREV,   IDSITPLANOATUAL, IDSITFUNCATUAL,   '+
                           ' IDEVENTOGERADOR, IDPESSJUR,       IDSITPARTATUAL,   '+
                           ' IDPLANOPREV,     IDPESSOA,        IDSITPLANONOVO,   '+
                           ' IDSITPARTNOVO,   DATAREGISTRO,    DATAEVENTO,       '+
                           ' FLGEFETIVADO,    DATAEFETIVADO,   DATAALTERADO,     '+
                           ' DATAVOLTA,       FLGSITFUNCIMED,  IDSITFUNCNOVO,    '+
                           ' FLGSITPARTIMED,  FLGSITPLANOIMED, SEQPROPOSTA,      '+
                           ' IDBENEFICIO,     FLGTPDEMISSAO,   IDREGRARESGATE,   '+
                           ' IDREGRACALCBENEF )'+
                           ' VALUES ( '+sIdEventosPrevAlt  +','+
                                        qryAux.FieldByName('IDSITPLANOATUAL').AsString  +','+
                                        qryAux.FieldByName('IDSITFUNCATUAL').AsString   +','+
                                        qryEvento.FieldByName('IDEVENTOGERADOR').AsString  +','+
                                        qryAux.FieldByName('IDPESSJUR').AsString        +','+
                                        qryAux.FieldByName('IDSITPARTATUAL').AsString   +','+
                                        qryAux.FieldByName('IDPLANOPREV').AsString      +','+
                                        qryAux.FieldByName('IDPESSOA').AsString         +','+
                                        qryAux.FieldByName('IDSITPLANONOVO').AsString   +','+
                                        qryAux.FieldByName('IDSITPARTNOVO').AsString    +','+
                                       ' To_Date(''' + DateToStr(Date)             + ''',''dd/MM/yyyy'')' + ',' +
                                       ' To_Date(''' + Trim(edDataEventoNova.Text) + ''',''dd/MM/yyyy'')' + ',' +
                                       '1'   + ','+
                                       'NULL'+ ','+
                                       'NULL'+ ','+
                                       'NULL'+ ','+
                                        ''''+qryAux.FieldByName('FLGSITFUNCIMED').AsString   +'''' +','+
                                        ''''+qryAux.FieldByName('IDSITFUNCNOVO').AsString    +'''' +','+
                                        ''''+qryAux.FieldByName('FLGSITPARTIMED').AsString   +'''' +','+
                                        ''''+qryAux.FieldByName('FLGSITPLANOIMED').AsString  +'''' +','+
                                        qryAux.FieldByName('SEQPROPOSTA').AsString                 +','+
                                        ''''+sIdBeneficio                                    +'''' +','+
                                        ''''+qryAux.FieldByName('FLGTPDEMISSAO').AsString    +'''' +','+
                                        ''''+sIdRegraResgate                                 +'''' +','+
                                        ''''+qryAux.FieldByName('IDREGRACALCULO').AsString   +'''' +')');

          try
             qryGrava.ExecSql;
          except
             RollBackTransacao;
             MsgDlg('Ocorreu um erro na Atualização. Evento não Efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
             Exit;
          end;

          qryAux.Next;
      end;

      //===== Insere Novo Historico de Contib p/ o novo evento
      Sql.Clear;
      Sql.Add('SELECT  IDEVENTOSPREV,   IDBENEFICIOA,    IDCONTRIBUICAOA, '+
              '        IDEVENTOGERADORF,IDPLANOPREVF, IDCONTRIBUICAOF, IDASSOCIACAO, '+
              '        TIPO,            FLGASSOCIADA, IDEVENTOGERADORA '+
              ' FROM   HSTCONTEVENTOSPR  '+
              ' WHERE  IDEVENTOSPREV   = '+sIdEventosPrev);
      Open;
      iIdAssociacao    := 0;
      while not Eof do
      begin
         iIdAssociacao := iIdAssociacao + 1;
         qryGrava.Sql.Clear;
         qryGrava.Sql.Add(' INSERT INTO HSTCONTEVENTOSPR '+
                          '(IDEVENTOSPREV,   IDBENEFICIOA,    IDCONTRIBUICAOA, '+
                          ' IDEVENTOGERADORF,IDPLANOPREVF, IDCONTRIBUICAOF, IDASSOCIACAO, '+
                          ' TIPO,            FLGASSOCIADA, IDEVENTOGERADORA) '+
                          ' VALUES ( '+sIdEventosPrevAlt  + ',' +
                                       ''''+qryAux.FieldByName('IDBENEFICIOA').AsString +''''+ ','+
                                       ''''+qryAux.FieldByName('IDCONTRIBUICAOA').AsString +''''+ ','+
                                       ''''+qryEvento.FieldByName('IDEVENTOGERADOR').AsString + ''''+ ','+
                                       ''''+qryAux.FieldByName('IDPLANOPREVF').AsString + ''''+ ','+
                                       ''''+qryAux.FieldByName('IDCONTRIBUICAOF').AsString + ''''+ ','+
                                       ''''+qryAux.FieldByName('IDASSOCIACAO').AsString + ''''+ ','+
                                       ''''+qryAux.FieldByName('TIPO').AsString + ''''+ ','+
                                       ''''+qryAux.FieldByName('FLGASSOCIADA').AsString       + ''''+ ','+
                                       ''''+qryEvento.FieldByName('IDEVENTOGERADOR').AsString + ''''+ ')');
          try
             qryGrava.ExecSql;
          except
             RollBackTransacao;
             MsgDlg('Ocorreu um erro na Atualização. Evento não Efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
             Exit;
          end;

          qryAux.Next;
      end;

      //===== Atualiza a nova data para as contribuicoes
      qryAux.Sql.Clear;
      qryAux.Sql.Add(' UPDATE CONTRIBPREVPARTP SET DATAFINAL  = To_Date(''' + sDataFinal   + ''',''DD/MM/YYYY'')' +
                     ' WHERE SEQPROPOSTA    = ' + sSeqProposta + ' AND ' +
                     '       IDPESSJUR      = ' + sIdPessJur   + ' AND ' +
                     '       IDPLANOPREV    = ' + sIdPlanoPrev + ' AND ' +
                     '       IDPESSOA       = ' + sIdPessoa    + ' AND ' +
                     '       FLGCOBRA     = 1 ');
      try
         qryAux.ExecSQL;
      except
          RollBackTransacao;
          MsgDlg('Ocorreu um erro na Atualização. Evento não Efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
          Exit;
      end;

      //===== Grava data final do evento alterado
      qryAux.Sql.Clear;
      qryAux.Sql.Add(' UPDATE EVENTOSPREV SET DATAVOLTA = To_Date(''' + edDataEventoNova.Text + ''',''DD/MM/YYYY'')' +
                     ' WHERE  IDEVENTOSPREV   = '+sIdEventosPrev +
                  ' AND    IDPESSOA        = '+sIdPessoa+
                  ' AND    IDPLANOPREV     = '+sIdPlanoPrev+
                  ' AND    IDPESSJUR       = '+sIdPessJur+
                  ' AND    SEQPROPOSTA     = '+sSeqProposta+
                  ' AND    IDEVENTOGERADOR = '+sIdEventoGerador);
      try
         qryAux.ExecSQL;
      except
          RollBackTransacao;
          MsgDlg('Ocorreu um erro na Atualização. Evento não Efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
          Exit;
      end;

      CommitTransacao;
      MsgDlg('Efetuado com Sucesso.','Informação',mtInformation,[mbOk,mbHelp],0);
   end;
end;



procedure TfrmCadAlteraPdv.AlteraBeneficio;
begin
   StartTransacao;
   //===== Grava data final do evento alterado
   qryAux.Sql.Clear;
   qryAux.Sql.Add(' UPDATE EVENTOSPREV      '+
                  ' SET    IDBENEFICIO      = '+qryBenef.FieldByName('IDBENEFICIO').AsString    +','+
                  '        IDREGRACALCBENEF = '+qryBenef.FieldByName('IDREGRACALCULO').AsString +
                  ' WHERE  IDEVENTOSPREV    = '+sIdEventosPrev +
                  ' AND    IDPESSOA         = '+sIdPessoa+
                  ' AND    IDPLANOPREV      = '+sIdPlanoPrev+
                  ' AND    IDPESSJUR        = '+sIdPessJur+
                  ' AND    SEQPROPOSTA      = '+sSeqProposta+
                  ' AND    IDEVENTOGERADOR  = '+sIdEventoGerador);
   try
      qryAux.ExecSQL;
   except
       RollBackTransacao;
       MsgDlg('Ocorreu um erro na Atualização. Evento não Efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
       Exit;
   end;

   //===== Atualiza a nova data para as contribuicoes
   qryAux.Sql.Clear;
   qryAux.Sql.Add(' UPDATE CONTRIBPREVPARTP SET DATAFINAL  = To_Date(''' + sDataFinal   + ''',''DD/MM/YYYY'')' +
                  ' WHERE SEQPROPOSTA    = ' + sSeqProposta + ' AND ' +
                  '       IDPESSJUR      = ' + sIdPessJur   + ' AND ' +
                  '       IDPLANOPREV    = ' + sIdPlanoPrev + ' AND ' +
                  '       IDPESSOA       = ' + sIdPessoa    + ' AND ' +
                  '       FLGCOBRA     = 1 ');
   try
      qryAux.ExecSQL;
   except
       RollBackTransacao;
       MsgDlg('Ocorreu um erro na Atualização. Evento não Efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
       Exit;
   end;
   CommitTransacao;
   MsgDlg('Efetuado com Sucesso.','Informação',mtInformation,[mbOk,mbHelp],0);

  Try
    If Not Sistema.GravaLogOperacoes('Alteração da Manunteção por PDV') Then
      raise exception.Create('Erro ao gravar Log.')
  Except
  End;
end;



procedure TfrmCadAlteraPdv.FormShow(Sender: TObject);
begin
  inherited;
  MontaSelectPart.Filtro.Add('PP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');
end;



end.