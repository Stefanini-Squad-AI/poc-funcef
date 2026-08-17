// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// -------------------------------------------------------------------------------------------------
//Alteração........: sbtnDesfazCancelamentoClick
//Nº SIG:........... 90598
//Data da Alteração: 22/08/2018
//Responsável......: Darivaldo Alencar
//Descrição........: Erro ao desfazer cancelamento de dependentes sem a PLANODEPENDENTE
// -------------------------------------------------------------------------------------------------
//Alteração........: sbtnCancelaDepClick
//Nº SIG:........... 90357
//Data da Alteração: 15/08/2018
//Responsável......: Darivaldo Alencar
//Descrição........: Erro ao converter data com data/hora
// -------------------------------------------------------------------------------------------------
//Alteração........: (dfm qryDet) MontaListaFiltraPlanos
//Nº SIG:........... 78339
//Data da Alteração: 16/11/2018
//Responsável......: Darivaldo Alencar
//Descrição........: Erro ao desfazer cancelamento de dependentes que não possui cadastro na tabela
//                   planodependente
// -------------------------------------------------------------------------------------------------

//Alteração........: (dfm qryDet) MontaListaFiltraPlanos
//Nº SIG:........... 25312
//Data da Alteração: 22/06/2017
//Responsável......: Darivaldo Alencar/ Andre Imakawa / Edilaine
//Descrição........: Inclusão de dados do cancelamento no form FregistraCancel
//		     Utilizar a tabela MOTIVO.
// -------------------------------------------------------------------------------------------------
//Nº SIG:........... 21866
//Data da Alteração: 28/09/2016
//Responsável......: Michelle Suellyn Mota
//Descrição........: Alteração apenas no DFM - Inclusão do campo Motivo Cancelamento.
// -------------------------------------------------------------------------------------------------
//Pendência   : SOL 231522 PPM 387881
//Responsável : Felipe A. Santos
//Data        : 23/05/2014
//Descrição   : erro de data ao procurar o dependente da matricula 0260050, alteração somente no dfm
//              qryDet DATACADASTRO, de o_date(D.DATACADASTRO, 'DD/MM/YYYY') DATACADASTRO
//              para D.DATACADASTRO.
// -------------------------------------------------------------------------------------------------
//Pendência   : SOL 208116 Kintana 2016014
//Responsável : Felipe A. Santos
//Data        : 07/05/2014
//Descrição   : Mudança na grid de designado para designado para resgate
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 205798 KTN 2013525
//Responsável : Felipe A. Santos
//Data        : 17/09/2013
//Descrição   : Alterado o caption da flg Dependente Legal para Dependente Funcef
// -------------------------------------------------------------------------------------------------
//Pendência   : SOL 230281 PPM 351149
//Responsável : William Moreira da Silva
//Data        : 14/04/2014
//Descrição   : Erro ao cancelar dependente. (.DFM)
// -------------------------------------------------------------------------------------------------
//Pendência   : SOL 215168 KINTANA 2044678
//Responsável : William Moreira da Silva
//Data        : 03/09/2013
//Descrição   : Ao cancelar dependente e escolher a opção de não cancelar para fins de IR, o sistema
//              desmarcava o campo de imposto de renda.
// -------------------------------------------------------------------------------------------------
//Pendência   : SOL 172704 KINTANA 1567834
//Responsável : RODRIGO DE BRITO FIGUEREDO
//Data        : 03/09/2012
//Descrição   : Criada a mensagem ao tentar alterar dependente de aposentado NOVO PLANO
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 156426  KINTANA 1232920
//Responsável : Vinicius Eduardo N. Maciel
//Descrição   : Foi alterado o Update realizado para quando for realizado o
//              cancelamento manual.
//------------------------------------------------------------------------------
//Pendência   : SOL 158030 Kintana 1275797
//Responsável : Fanuel Junior
//Descrição   : Foi retirado da tela CADASTRO/DEPENDENTE E BENEFICIÁRIO/CANCELAMENTO, o combobox SITUAÇÂO.
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 141428  KINTANA 893958
//Responsável : Renato Visoni
//Descrição   : Inserção de crítica e cancelamento quando do cadastro do beneficiário do tipo irmão
//              e outros e que possua idade superior a 24 anos
//--------------------------------------------------------------------------------------------------
// Rotina      : sbtnCancelaDepClick
// Autor(a)    : Gleyber
// Pendência   : 23409
// Data        : 27/09/2006
// Descricao   : Correção na query que verifica se o dependente recebe beneficios
//               para não buscar benefícios encerrados.
//------------------------------------------------------------------------------
// Rotina      : sbtnProcurarClick
// Autor(a)    : Gleyber
// Pendência   : 22660
// Data        : 22/06/2005
// Descricao   : Correção para habilitar cancelamento apenas de elegível.
//------------------------------------------------------------------------------
// Rotina      : sbtnCancelaDepClick
// Autor(a)    : Augusto
// Pendência   : 19133
// Data        : 14/06/2005
// Descricao   : Atualizar campos FLGCONTAIMPOSTOR, FLGCONTASALARIOF quando cancelar
//               dependente  
//------------------------------------------------------------------------------
// Rotina      : sbtnCancelaDepClick
// Autor(a)    : Augusto
// Pendência   : 18337
// Data        : 02/02/2005
// Descricao   : Caso cancelamento em data anterior a atual, pedir confirmação.
//------------------------------------------------------------------------------
// Rotina      : ----
// Autor(a)    : Camille
// Pendência   : 16683
// Data        : 05.05.2004
// Descricao   : Atualizar numero de dependentes total, para ir e para sal.familia
//               do titular
//------------------------------------------------------------------------------
unit FCancelaDependente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, DBCtrls, MontaSelect, Db, Wwdatsrc,
  DBTables, Wwquery, TB97Ctls, ImgList, Grids, Wwdbigrd, Wwdbgrid,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, Mask, wwdbedit, Wwdotdot,
  Wwdbcomb
  ,fRegistraCancel,fTelaAut,UDataBase //Darivaldo Alencar SIG25312
 ;

type
  TfrmCancelaDependente = class(TfrmSairAjuda)
    ImlPadrao: TImageList;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    sbtnProcurar: TToolbarButton97;
    qry: TwwQuery;
    qryNOME: TStringField;
    qryNUMDOCUMENTO: TStringField;
    qryNOMEPATRO: TStringField;
    qryNOMEPLANO: TStringField;
    qryMATRICULA: TStringField;
    qryINSCRICAONUMERO: TFloatField;
    qryIDPESSJUR: TFloatField;
    qryIDPLANOPREV: TFloatField;
    qryIDPESSOA: TFloatField;
    qrySEQPROPOSTA: TFloatField;
    qryFLGINTERNO: TStringField;
    qryINSCRICAODATA: TDateTimeField;
    qryIDSITPART: TFloatField;
    qryDATANASC: TDateTimeField;
    qrySALARIO: TFloatField;
    qryTIPO: TStringField;
    qryIDIMAGEM: TFloatField;
    qryIDRGELEGBENEF: TFloatField;
    qryNOMEVALORBASE1: TStringField;
    qryNOMEVALORBASE2: TStringField;
    qryNOMEVALORBASE3: TStringField;
    qryVALORBASE1: TFloatField;
    qryVALORBASE2: TFloatField;
    qryVALORBASE3: TFloatField;
    qrySITPARTDESCRICAO: TStringField;
    ds: TwwDataSource;
    MontaSelect: TMontaSelect;
    pnlMestre: TPanel;
    lblParticipante: TLabel;
    lblMatricula: TLabel;
    lblPatro: TLabel;
    lblInscricao: TLabel;
    lblPlanoPrev: TLabel;
    dbTNome: TDBText;
    dbTPatro: TDBText;
    dbTPlano: TDBText;
    dbTMatricula: TDBText;
    dbTInscricao: TDBText;
    Label40: TLabel;
    dbSitPart: TDBText;
    PageControl1: TPageControl;
    tbsDependentes: TTabSheet;
    pnlCtrlDependentes: TPanel;
    qryDet: TwwQuery;
    dbgrdDet: TwwDBGrid;
    dsDet: TwwDataSource;
    sbtnCancelaDep: TToolbarButton97;
    qryAux: TwwQuery;
    Label1: TLabel;
    dtCancelamento: TCMDateTimePicker;
    sbtnDesfazCancelamento: TToolbarButton97;
    qrySitDependente: TwwQuery;
    Label2: TLabel;
    dblkpSitDependente: TwwDBLookupCombo;
    qryNUMDEPIRRF: TFloatField;
    qryNUMDEPSALF: TFloatField;
    qryNUMDEPTOT: TFloatField;
    lblMotivoCancel: TLabel;
    cbbMOTIVOCANCEL: TwwDBLookupCombo;
    wwDBTpDepen: TwwDBComboBox;
    lblPlano: TLabel;
    qryMotivo: TwwQuery;
    dsMotivo: TDataSource;
    qryPlanPrev: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnCancelaDepClick(Sender: TObject);
    procedure dbgrdDetCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure sbtnDesfazCancelamentoClick(Sender: TObject);
      Function ValidaPlano(IDtitular : String) : Boolean;
    procedure FormCreate(Sender: TObject);
    procedure wwDBTpDepenChange(Sender: TObject);//Rodrigo de Brito Figueredo - SOL 172704  Kintana 1567834
  private
    { Private declarations }
    Function  SQLDataCancelamento(iOprc: Integer): String; //Darivaldo Alencar SIG25312
    procedure MontaListaFiltraPlanos;                      //edilaine - SIG25312
    function PossuiPlanoDependente(iIdPessoa, iIdTitular: Integer): Boolean; //SIG90598

  public

  end;

var
  frmCancelaDependente: TfrmCancelaDependente;

implementation

uses DBaseDados, USistema, UMensErro, UModulo, uAdmPrev;

{$R *.DFM}

procedure TfrmCancelaDependente.FormShow(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('IDPESSJUR').AsInteger    := -1;
  qry.ParamByName('IDPLANOPREV').AsInteger  := -1;
  qry.ParamByName('IDPESSOA').AsInteger     := -1;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDTITULAR').AsInteger := -1;
  qryDet.Open;
  //Fanuel Junior SOL 158030 Kintana 1275797
  //qrySitDependente.Close;
  //qrySitDependente.Open;

end;

procedure TfrmCancelaDependente.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;

  if MontaSelect.RetornouValor
  then begin
     
     qry.Close;
     qry.SQL.Clear;
     qry.SQL.Add('SELECT P.NOME,P.NUMDOCUMENTO,');
     qry.SQL.Add('       PT.NOME AS NOMEPATRO,');
     qry.SQL.Add('       PL.NOME AS NOMEPLANO,');
     qry.SQL.Add('       EL.MATRICULA,');
     qry.SQL.Add('       PP.INSCRICAONUMERO,');
     qry.SQL.Add('       EL.IDPESSJUR,');
     qry.SQL.Add('       PP.IDPLANOPREV,');
     qry.SQL.Add('       EL.IDPESSOA,');
     qry.SQL.Add('       PP.SEQPROPOSTA,');
     qry.SQL.Add('       SP.FLGINTERNO,');
     qry.SQL.Add('       NVL(SP.DESCRICAO,''ELEGÍVEL'') AS SITPARTDESCRICAO,');
     qry.SQL.Add('       PP.INSCRICAODATA,');
     qry.SQL.Add('       PP.IDSITPART,');
     qry.SQL.Add('       PF.DATANASC,');
     qry.SQL.Add('       P.TIPO,');
     qry.SQL.Add('       P.IDIMAGEM,');
     qry.SQL.Add('       DECODE(SP.FLGINTERNO, ''MA'', PP.SALMANTIDO, PP.SALPARTICIPACAO) AS SALARIO,');
     qry.SQL.Add('       PL.IDRGELEGBENEF,');
     qry.SQL.Add('       EL.VALORBASE1,');
     qry.SQL.Add('       EL.VALORBASE2,');
     qry.SQL.Add('       EL.VALORBASE3,');
     qry.SQL.Add('       PAT.NOMEVALORBASE1,');
     qry.SQL.Add('       PAT.NOMEVALORBASE2,');
     qry.SQL.Add('       PAT.NOMEVALORBASE3,');
     qry.SQL.Add('       PF.NUMDEPIRRF, PF.NUMDEPSALF, PF.NUMDEPTOT');
     qry.SQL.Add('FROM PESSOA       P,');
     qry.SQL.Add('     PESSOA       PT,');
     qry.SQL.Add('     PESSOAFISICA PF,');
     qry.SQL.Add('     PLANPREV     PL,');
     qry.SQL.Add('     PARTPREVPLAN PP,');
     qry.SQL.Add('     ELEGPATRO    EL,');
     qry.SQL.Add('     SITPART      SP,');
     qry.SQL.Add('     PATRO        PAT');
     qry.SQL.Add('WHERE (EL.IDPESSOA         ='+MontaSelect.ValoresChave[0]+')');
     qry.SQL.Add('  AND (EL.IDPESSJUR        ='+MontaSelect.ValoresChave[1]+')');
     qry.SQL.Add('  AND (PP.IDPESSOA(+)      = EL.IDPESSOA) ');
     qry.SQL.Add('  AND (PP.IDPESSJUR(+)     = EL.IDPESSJUR)');
     If Trim(MontaSelect.ValoresChave[3]) <> ''
      Then qry.SQL.Add('  AND (PP.IDPLANOPREV     = '+MontaSelect.ValoresChave[3]+') ')
      Else qry.SQL.Add('  AND (PP.IDPLANOPREV IS NULL)');

     qry.SQL.Add('  AND (PL.IDPLANOPREV(+)   = PP.IDPLANOPREV)');
     qry.SQL.Add('  AND (EL.IDPESSOA         = P.IDPESSOA)');
     qry.SQL.Add('  AND (EL.IDPESSJUR        = PT.IDPESSOA)');
     qry.SQL.Add('  AND (PP.IDSITPART        = SP.IDSITPART(+))');
     qry.SQL.Add('  AND (EL.IDPESSOA         = PF.IDPESSOA)');
     qry.SQL.Add('  AND (PAT.IDPESSOA        = EL.IDPESSJUR)');
     qry.Open;

     qryDet.Close;
     qryDet.ParamByName('IDTITULAR').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
     qryDet.Open;
  end;
  sbtnProcurar.Down := False;

  MontaListaFiltraPlanos();   //edilaine - SIG25312

  wwDBTpDepenChange(self);//Darivaldo Aelncar SIG25312
end;

procedure TfrmCancelaDependente.sbtnCancelaDepClick(Sender: TObject);
Var
  sSQL,
  sMens       : String;
  bCancelIR,
  bCancelSF   : Boolean;
begin
//Darivaldo Alencar SIG25312 -inicio
 if (qryDet.FieldByName('DATACANCEL').AsString <> '')then
   exit;

 AbrirFormModal(frmRegistraCancel, TfrmRegistraCancel);
 if (frmRegistraCancel.ModalResult <> mrOK) then
     abort;
// If (cbbMOTIVOCANCEL.LookupValue = EmptyStr) Then Begin
//    MsgDlg('Selecione o Motivo do Cancelamento.','Erro',mtError,[mbOk],0);
//    Exit;
//  End;

//  If Trim(dtCancelamento.Text) = '' Then Begin
//    MsgDlg('A Data de Cancelamento esta vazia.','Erro',mtError,[mbOk],0);
//    Exit;
//  End;
 dtCancelamento.text         := frmRegistraCancel.dtCancelamento.text;
 cbbMOTIVOCANCEL.LookupValue := frmRegistraCancel.cbbMOTIVOCANCEL.LookupValue;
//Darivaldo Alencar SIG25312 -fim

  If StrToDate(dtCancelamento.Text) < Date Then Begin
    if MsgDlg('A Data de Cancelamento esta anterior a data atual'+#13+
              'Confirma esta informação ? ',
              'Atenção ',mtConfirmation,[mbYes, mbNo],0) = mrNo
    then begin
      Exit;
    End;
  End;

  If qryDet.FieldByName('FLGCONTAIMPOSTOR').AsInteger = 1
   Then bCancelIR := ( MsgDlg('Este dependente conta para Imposto de Renda.'+#13+
                              'Deseja cancelá-lo também para fins de imposto de renda ?',
                              'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes);

  If qryDet.FieldByName('FLGCONTASALARIOF').AsInteger = 1
   Then bCancelSF := ( MsgDlg('Este dependente conta para Salário Família.'+#13+
                              'Deseja cancelá-lo também para fins de salário família ?',
                              'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes);

  sMens := 'Essa cancelamento irá atualizar os seguintes campos do titular : '  +#13;

  If bCancelIR
   Then sMens := sMens + '    . No. de Dependentes para IR,            '+#13;

  If bCancelSF
   Then sMens := sMens + '    . No. de Dependentes para Sal. Família e '+#13;

  sMens := sMens + '    . No. de Dependentes Total '+#13+
          'Confirma o cancelamento do dependente '+qryDet.FieldByName('NOME').AsString+' ? ';

  if MsgDlg(sMens,'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
  then Exit;

 if Trim(dtCancelamento.Text) = ''
  then begin
     MsgDlg('Indique a Data do Cancelamento.','Erro',mtError,[mbOK],0);
     Exit;
  end;
      
  if (qryDet.FieldByName('DATACADASTRO').AsString <> '') and
     //(StrToDate(dtCancelamento.Text) < StrToDate(qryDet.FieldByName('DATACADASTRO').AsString))                                //SIG90357
     (StrToDate(dtCancelamento.Text) < StrToDate(FormatDateTime('DD/MM/YYYY', qryDet.FieldByName('DATACADASTRO').AsDateTime)))  //SIG90357

  then begin
     MsgDlg('A Data do Cancelamento deve ser igual ou posterior a Data do Cadastro do dependente. Verifique.','Erro',mtError,[mbOK],0);
     Exit;
  end;

   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT B.NOME, S.DESCRICAO AS SITUACAO  '+
              ' FROM   BENEFBFCIARIO BF, BENEFICIO B, SITBENEFICIO S '+
              ' WHERE  BF.IDTITULAR = '+qryDet.FieldByName('IDTITULAR').AsString+
              ' AND    BF.IDPESSOA  = '+qryDet.FieldByName('IDPESSOA').AsString+
              ' AND    ((BF.DATAFINAL IS NULL) OR (BF.DATAFINAL >= SYSDATE)) '+
              ' AND    B.IDBENEFICIO = BF.IDBENEFICIO '+
              ' AND    S.IDSITBENEFICIO = BF.IDSITBENEFICIO '+
              ' AND    BF.IDSITBENEFICIO <> 3'); 
      Open;
      if not IsEmpty
      then begin
         MsgDlg('O dependente '+qryDet.FieldByName('NOME').AsString+' possui o benefício '+FieldByName('NOME').AsString+
                ' com situação de '+FieldByName('SITUACAO').AsString+'.'+#13+
                'A rotina de encerramento de benefícios deve ser executada antes do cancelamento do dependente. Verifique.','Informação',mtInformation,[mbOK],0);
         Exit;
      end;
   end;

   dtmBaseDados.dbBaseDados.StartTransaction;
   //Darivaldo Alencar SIG25312 -Inicio
   sSQL:=  ' UPDATE PLANODEPENDENTE SET DATACANCEL = TO_DATE('''+dtCancelamento.Text+''',''DD/MM/YYYY''), '+
           ' ID_MOTIVOCANCEL = ' + cbbMOTIVOCANCEL.LookupValue +
           ' WHERE  IDPESSOA  = ' + qryDet.FieldByName('IDPESSOA').AsString;
   if ((qryDet.FieldByName('IDPLANOPREV').AsString <> EmptyStr) and (qryDet.FieldByName('IDPLANOPREV').AsString <> '0')) then
      sSQL:= sSQL + ' AND IDPLANOPREV  = ' + qryDet.FieldByName('IDPLANOPREV').AsString;
   try
      ExecutarQuery(qryAux,sSQL);
   except
      dtmBaseDados.dbBaseDados.Rollback;
      Exit;
   end;
   //Darivaldo Alencar SIG25312 -Fim


   with qryAux do
   begin
      Close;
      SQL.Clear;

      //Darivaldo Alencar SIG25312 -inicio
      //sSQL := ' UPDATE DEPENTIT SET DATACANCELA = TO_DATE('''+dtCancelamento.Text+''',''DD/MM/YYYY''), MOTIVOCANCEL = ' + IntToStr(cbbMOTIVOCANCEL.ItemIndex + 1); // Michelle Mota - SIG 21866
      sSQL := SQLDataCancelamento(1) ;
      //Darivaldo Alencar SIG25312 -fim

      //Vinicius Maciel - SOL 156426 - KINTANA 1232920
      if bCancelIR then//William Moreira da Silva - SOL 215168 KTN 2044678
         sSQL := sSQL + ', FLGIGNORAVALIR = 1, FIMIMPOSTOR = SYSDATE, FLGCONTAIMPOSTOR = 0 ';

     { If bCancelIR  Then Begin
        sSQL := sSQL + ', FIMIMPOSTOR = TO_DATE('''+dtCancelamento.Text+''',''DD/MM/YYYY'') '+
                       ', FLGCONTAIMPOSTOR = 0 ';
      end;   }

      //Vinicius Maciel - SOL 156426 - KINTANA 1232920 - FIM


      If bCancelSF Then Begin
        sSQL := sSQL + ', FIMSALARIOF = TO_DATE('''+dtCancelamento.Text+''',''DD/MM/YYYY'') '+
                       ', FLGCONTASALARIOF = 0 ' ;
      End;


      sSQL := sSQL + ', TIPOCANCELAMENTO = 0'; //Renato Visoni SOL 141428  KINTANA 893958
      

      sSQL := sSQL + ' WHERE  IDTITULAR = '+qryDet.FieldByName('IDTITULAR').AsString+
              ' AND    IDPESSOA  = '+qryDet.FieldByName('IDPESSOA').AsString;

      SQL.Add(sSQL);
      
      try
         ExecSQL;
      except
         dtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Erro ao cancelar o dependente '+qryDet.FieldByName('NOME').AsString+'. Verifique.','Erro',mtError,[mbOK],0);
         Exit;
      end;

       //Fanuel Junior SOL 158030 Kintana 1275797
      {
      Close;
      SQL.Clear;
      if Trim(dblkpSitDependente.Text) <> ''
      then SQL.Add(' UPDATE DEPENDENTE SET IDSITDEPENDENTE = '+qrySitDependente.FieldByName('IDSITDEPENDENTE').AsString)
      else SQL.Add(' UPDATE DEPENDENTE SET IDSITDEPENDENTE = NULL ');

      SQL.Add(' WHERE  IDPESSOA  = '+qryDet.FieldByName('IDPESSOA').AsString);

      try
         ExecSQL;
      except
         dtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Erro ao cancelar o dependente '+qryDet.FieldByName('NOME').AsString+'. Verifique.','Erro',mtError,[mbOK],0);
         Exit;
      end;
      }

   end;

   sSQL := '';
   if qry.FieldByName('NUMDEPTOT').AsInteger >= 1
   then if Trim(sSQL) = ''
        then sSQL :=        '   NUMDEPTOT = NUMDEPTOT - 1 '
        else sSQL := sSQL + ' , NUMDEPTOT = NUMDEPTOT - 1 ';

   if (qry.FieldByName('NUMDEPSALF').AsInteger >= 1)
      And (bCancelSF) 
   then if Trim(sSQL) = ''
        then sSQL :=       '   NUMDEPSALF = NUMDEPSALF - 1 '
        else sSQL := sSQL +' , NUMDEPSALF = NUMDEPSALF - 1 ';

   if (qry.FieldByName('NUMDEPIRRF').AsInteger >= 1)
     And (bCancelIR)  
   then if Trim(sSQL) = ''
        then sSQL :=       '   NUMDEPIRRF = NUMDEPIRRF - 1 '
        else sSQL := sSQL +' , NUMDEPIRRF = NUMDEPIRRF - 1 ';


   if Trim(sSQL) <> ''
   then begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' UPDATE PESSOAFISICA SET '+sSQL+
                     ' WHERE  IDPESSOA = '+qryDet.FieldByName('IDTITULAR').AsString);
      try
         qryAux.ExecSQL;
      except
         dtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Erro ao atualizar número de dependentes do titular de '+qryDet.FieldByName('NOME').AsString+'. Verifique.','Erro',mtError,[mbOK],0);
         Exit;
      end;
   end;

   
   sMens := 'Cancelamento Dep.: '+qryDet.FieldByName('NOME').AsString+' - '+
            ' - Tit.:'+qry.FieldByName('MATRICULA').AsString+' - ';

   If bCancelIR
    Then sMens := sMens + 'IR - ';

   If bCancelSF
    Then sMens := sMens + 'Sal.Família - ';

   sMens := sMens + 'Data : '+dtCancelamento.Text;

   GravaLogTOTALPREV (sMens);


   dtmBaseDados.dbBaseDados.Commit;
   MsgDlg('Dependente Cancelado.','Informação',mtInformation,[mbOK],0);

   //Rodrigo de Brito Figueredo - SOL 172704  Kintana 1567834 - Inicio
   if ValidaPlano(MontaSelect.ValoresChave[0]) then
   begin
      MsgDlg('Houve alteração nos dependentes. É necessário revisar o benefício do NOVO PLANO.','Informação',mtInformation,[mbOk,mbHelp],0);
   end;
   //Rodrigo de Brito Figueredo - SOL 172704  Kintana 1567834 - Fim

   qryDet.Close;
   qryDet.ParamByName('IDTITULAR').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
   qryDet.Open;

end;

procedure TfrmCancelaDependente.dbgrdDetCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if qryDet.FieldByName('DATACANCELA').AsString <> ''
  then AFont.Color := clRed
  else AFont.Color := clWindowText;
end;

procedure TfrmCancelaDependente.sbtnDesfazCancelamentoClick(
  Sender: TObject);
var
  sSQL: String;    //Darivaldo Alencar SIG25312
begin
  //edilaine  SIG25312 - inicio
  {if (qryDet.FieldByName('DATACANCELA').AsString = '')
  then begin
     MsgDlg('O dependente '+qryDet.FieldByName('NOME').AsString+' não está cancelado. Verifique.','Erro',mtError,[mbOK],0);
     Exit;
  end;
  }//edilaine  SIG25312 - fim

  //Darivaldo Alencar SIG25312 - Inicio
  //if not MsgDlg('Deseja DESFAZER o cancelamento do dependente '+qryDet.FieldByName('NOME').AsString+' ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo //Darivaldo Alencar SIG25312

  //Darivaldo Alencar SIG78339 -Inicio
  //SIG90598 -Inicio
  //FazQuery(qryAux,'SELECT count(1) as total FROM PLANODEPENDENTE WHERE IDPESSOA  = '+ qryDet.FieldByName('IDPESSOA').AsString);
  //if (qryAux.fieldbyname('total').asInteger <> 0)  then
  if PossuiPlanoDependente(qryDet.FieldByName('IDPESSOA').AsInteger, qryDet.FieldByName('IDTITULAR').AsInteger) then
  //SIG90598 -Fim
    begin
  //Darivaldo Alencar SIG78339 -fim
      if (qryDet.FieldByName('DATACANCEL').AsString <> emptystr) then
        begin
          if MsgDlg('Deseja DESFAZER o cancelamento do dependente '+qryDet.FieldByName('NOME').AsString+' ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo      //Darivaldo Alencar SIG25312
          then Exit;
        end
      else
      begin
        MsgDlg('O dependente '+qryDet.FieldByName('NOME').AsString+' não está cancelado. Verifique.','Erro',mtError,[mbOK],0);
        exit;
      end;
  //Darivaldo Alencar SIG25312 -Fim

  //Darivaldo Alencar SIG78339 -Inicio
    end
  else begin
      if (qryDet.FieldByName('DATACANCELA').AsString <> EmptyStr) then
        begin
          if MsgDlg('Deseja DESFAZER o cancelamento do dependente '+qryDet.FieldByName('NOME').AsString+' ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo      //Darivaldo Alencar SIG25312
          then Exit;
        end
      else
      begin
        MsgDlg('O dependente '+qryDet.FieldByName('NOME').AsString+' não está cancelado. Verifique.','Erro',mtError,[mbOK],0);
        exit;
      end;
  end;
  //Darivaldo Alencar SIG78339 -Fim

   dtmBaseDados.dbBaseDados.StartTransaction;

   //Darivaldo Alencar SIG25312 -Inicio
   sSQL:=  ' UPDATE PLANODEPENDENTE SET DATACANCEL = NULL, ID_MOTIVOCANCEL = NULL  ' +
           ' WHERE  IDPESSOA  = ' + qryDet.FieldByName('IDPESSOA').AsString ;
   if ((qryDet.FieldByName('IDPLANOPREV').AsString <> EmptyStr) and (qryDet.FieldByName('IDPLANOPREV').AsString <> '0')) then
         sSQL:=  sSQL + ' AND IDPLANOPREV  = ' + qryDet.FieldByName('IDPLANOPREV').AsString;
   try
      ExecutarQuery(qryAux,sSQL);
   except
      dtmBaseDados.dbBaseDados.Rollback;
      Exit;
   end;
   //Darivaldo Alencar SIG25312 -Fim

   with qryAux do
   begin
      Close;

      SQL.Clear;
      //Darivaldo Alencar SIG25312 -Inicio
      sSQL := SQLDataCancelamento(2);
      //SQL.Add(' UPDATE DEPENTIT SET DATACANCELA = NULL , TIPOCANCELAMENTO = 0'+ //Renato Visoni SOL 141428  KINTANA 893958
      SQL.add(sSQL + ', TIPOCANCELAMENTO = 0, MOTIVOCANCEL = 0' +
      //Darivaldo Alencar SIG25312 -Fim
              ' WHERE  IDTITULAR = '+qryDet.FieldByName('IDTITULAR').AsString +
              ' AND    IDPESSOA  = '+qryDet.FieldByName('IDPESSOA').AsString);
      try
         ExecSQL;
      except
         dtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Erro ao cancelar o dependente '+qryDet.FieldByName('NOME').AsString+'. Verifique.','Erro',mtError,[mbOK],0);
         Exit;
      end;

      //Fanuel Junior SOL 158030 Kintana 1275797
      {Close;
      SQL.Clear;
      if Trim(dblkpSitDependente.Text) <> ''
      then SQL.Add(' UPDATE DEPENDENTE SET IDSITDEPENDENTE = '+qrySitDependente.FieldByName('IDSITDEPENDENTE').AsString)
      else SQL.Add(' UPDATE DEPENDENTE SET IDSITDEPENDENTE = NULL ');

      SQL.Add(' WHERE  IDPESSOA  = '+qryDet.FieldByName('IDPESSOA').AsString);

      try
         ExecSQL;
      except
         dtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Erro ao cancelar o dependente '+qryDet.FieldByName('NOME').AsString+'. Verifique.','Erro',mtError,[mbOK],0);
         Exit;
      end;}
   end;

   GravaLogTOTALPREV ('DESFAZER Cancelamento Dependente - Tit.:'+qry.FieldByName('MATRICULA').AsString+' - '+
                             'Dep : '+qryDet.FieldByName('NOME').AsString+' - '+
                             'Data : '+dtCancelamento.Text);

   dtmBaseDados.dbBaseDados.Commit;
   // Gleyber - 17/06/2004 - Pendência 17030 - Início
   MsgDlg('ATENÇÃO!!'+#13+#10+''+#13+#10+'Os cancelamentos efetuados para fins de Imposto de Renda '+#13+#10+
          'e/ou para fins de Salário Família NÃO poderão ser desfeitos por '+#13+#10+'esta operação. Entre no cadastro '+
          'e faça a alteração manual.', 'Informação Importante', mtWarning, [mbOK], 0);
   // Gleyber - 17/06/2004 - Pendência 17030 - Fim
   MsgDlg('Cancelamento Desfeito com Sucesso.','Informação',mtInformation,[mbOK],0);


   //Rodrigo de Brito Figueredo - SOL 172704  Kintana 1567834 - Inicio
   if ValidaPlano(MontaSelect.ValoresChave[0]) then
   begin
      MsgDlg('Houve alteração nos dependentes. É necessário revisar o benefício do NOVO PLANO.','Informação',mtInformation,[mbOk,mbHelp],0);
   end;
   //Rodrigo de Brito Figueredo - SOL 172704  Kintana 1567834 - Fim


   qryDet.Close;
   qryDet.ParamByName('IDTITULAR').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
   qryDet.Open;
end;

//Rodrigo de Brito Figueredo - SOL 172704  Kintana 1567834  - Inicio
function TfrmCancelaDependente.ValidaPlano(IDtitular : String): Boolean;
var
   qryValida : TwwQuery;
begin
   Result:=false;
   try
   qryValida := TwwQuery.Create(Self);
   qryValida.DatabaseName:= qry.DatabaseName;

   with qryValida do
   begin
       SQL.Add('select * from partprevplan pl ');
       SQL.Add('  where pl.idpessoa = '+IDtitular);
       SQL.Add('  and pl.idsitpart in (11,12,4,15)');
       SQL.Add('  and pl.idplanoprev = 74');
       open;
       if not isEmpty then
       begin
          Result:=true;
       end;
   end;
   finally
         qryValida.free;
   end;
end;
//Rodrigo de Brito Figueredo - SOL 172704  Kintana 1567834  - Fim


//Darivaldo Alencar SIG25312 -inicio
procedure TfrmCancelaDependente.FormCreate(Sender: TObject);
begin
  inherited;
  Label1.Visible         := false;
  dtCancelamento.visible := false;
  lblMotivoCancel.visible:= false;
  cbbMOTIVOCANCEL.visible:= false;
  qryMotivo.close;
  qryMotivo.open;
end;

procedure TfrmCancelaDependente.wwDBTpDepenChange(Sender: TObject);
var    filtro : string;
begin
  inherited;
  filtro := wwDBTpDepen.Value;

  if(filtro <> '0') then
  begin
    if(filtro = '1') then
    begin
        qryDet.Filtered := false;
        qryDet.Filter   := 'FLGCONTAIMPOSTOR = '+ filtro;
        qryDet.Filtered := True;
    end
    else begin
       if (filtro<> EmptyStr) then
         begin
           qryDet.Filtered := false;
           qryDet.Filter   := 'IDPLANOPREV = ' + filtro;
           qryDet.Filtered := True;
         end
       else begin
         qryDet.Filtered := false;
         qryDet.Filter   := '';
       end;
    end;
  end
  else begin
     qryDet.Filtered := false;
     qryDet.Filter   := '';
  end;
end;

function TfrmCancelaDependente.SQLDataCancelamento(iOprc: Integer): String;
begin
   if FazQuery(qryAux,'SELECT DATACANCEL FROM PLANODEPENDENTE WHERE IDPESSOA  = '+ qryDet.FieldByName('IDPESSOA').AsString) then
      begin
         //Se o dependente possui algum plano não cancelado ("Data do Cancelamento no Plano" nula), o campo "Cancelado em" deverá estar nulo também.
         if FazQuery(qryAux,'SELECT DATACANCEL FROM PLANODEPENDENTE WHERE DATACANCEL IS NULL AND IDPESSOA  = '+qryDet.FieldByName('IDPESSOA').AsString) then
             Result:= ' UPDATE DEPENTIT SET DATACANCELA =  NULL '
         else begin
             //Caso todos os planos do dependente estejam cancelados, atualizar o campo "Cancelado em" com a maior "Data do Cancelamento no Plano"
             //dentre os planos do dependente.
             if FazQuery(qryAux,'SELECT MAX(DATACANCEL) as DATACANCEL FROM PLANODEPENDENTE WHERE IDPESSOA  = '+qryDet.FieldByName('IDPESSOA').AsString)
             then begin
                 if (qryAux.fieldbyname('DATACANCEL').asDateTime <  dtCancelamento.date) then
                      Result:= ' UPDATE DEPENTIT SET DATACANCELA = TO_DATE('''+dtCancelamento.Text+''',''DD/MM/YYYY'') '
                 else Result:= ' UPDATE DEPENTIT SET DATACANCELA = TO_DATE('''+qryAux.fieldbyname('DATACANCEL').asString +''',''DD/MM/YYYY'') '
             end
             else Result:= ' UPDATE DEPENTIT SET DATACANCELA =  NULL ';
         end;
      end
   else  begin
      //Atualiza DEPENTIT quando não existe registro na tabela PLANODEPENDENTE
      if (iOprc = 1) then
          Result :=' UPDATE DEPENTIT SET DATACANCELA = TO_DATE('''+dtCancelamento.Text+''',''DD/MM/YYYY'') '
      else Result:=' UPDATE DEPENTIT SET DATACANCELA = NULL '
   end;

   qryAux.SQL.Clear;
end;
//Darivaldo Alencar SIG25312 -fim

// edilaine - SIG25312 - inicio
procedure TfrmCancelaDependente.MontaListaFiltraPlanos;
var
  sItem : string;
begin
  qryDet.DisableControls;
  wwDBTpDepen.Items.Clear;
  if not qryDet.IsEmpty then
  begin
    wwDBTpDepen.Sorted := True;
    while not qryDet.eof do
    begin
      sItem := qryDet.FieldByName('PLANO').AsString + #9 + qryDet.FieldByName('IDPLANOPREV').AsString;

      if wwDBTpDepen.Items.IndexOf(sItem) = -1 then
         wwDBTpDepen.Items.Add(sItem);

      qryDet.next;
    end;
    wwDBTpDepen.Sorted := false;
    wwDBTpDepen.Items.Add('Imposto de Renda' + #9 + '1');
    wwDBTpDepen.Items.Add('Todos'            + #9 + '0');
  end;
  wwDBTpDepen.ApplyList;
  qryDet.EnableControls;
end;
// edilaine - SIG25312 - fim

//SIG90598 -inicio
function TfrmCancelaDependente.PossuiPlanoDependente(iIdPessoa, iIdTitular: Integer): Boolean;
begin
  FazQuery(qryAux, 'SELECT COUNT(1) FROM PLANODEPENDENTE WHERE IDPESSOA IN('+ IntToStr(iIdPessoa) +') AND IDTITULAR IN('+ IntToStr(iIdTitular) +') ' );
  result:= qryAux.Fields[0].AsInteger <> 0;
end;
//SIG90598 -fim

end.
