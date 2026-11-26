unit FParamRelPartDeb;
// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Gleyber
// Data        : 26/06/2007
// Rotina      : bbtnConfirmarClick e bbtnCancelarClick
// Pendência   : 22570
// Descrição   : Alteração para permitir a escolha de um determinado período
//               para gerar o relatório.
//--------------------------------------------------------------------------------------------------
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, checklst, Mask,
  wwdbedit, Wwdbspin,UDataBase, Wwdatsrc, wwdblook;

Const
 vQl = #13+#10;

type
  TfrmParamRelPartDeb = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    dbseanoInicial: TwwDBSpinEdit;
    cbmesInicial: TComboBox;
    GroupBox2: TGroupBox;
    chklstPatro: TCheckListBox;
    qrypatro: TwwQuery;
    GroupBox3: TGroupBox;
    chklstSitPlan: TCheckListBox;
    qrySitPlan: TwwQuery;
    GroupBox4: TGroupBox;
    dbcContribuicao: TwwDBLookupCombo;
    qryContrib: TwwQuery;
    GroupBox5: TGroupBox;
    dbseanoFinal: TwwDBSpinEdit;
    cbmesFinal: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  Procedure CriaLista(ChkList:TCheckListBox; Query:TwwQuery;
            Lista: TStringList; Chave, Descricao:String);

var
  frmParamRelPartDeb: TfrmParamRelPartDeb;
  i:integer;
  LstPatro, LstSitPlan:TStringList;
  SPatro,SSitPlan,ssql:String;
  wDia,wMes,wAno : Word;

implementation

USES UMensErro, dRelatAdmPrev, UAdmPrev;
{$R *.DFM}

procedure TfrmParamRelPartDeb.FormShow(Sender: TObject);
begin
  inherited;
  DecodeDate(Date, wAno, wMes, wDia);
  cbMesInicial.ItemIndex := wMes - 1; 
  cbMesFinal.ItemIndex   := wMes - 1; 
  dbseAnoInicial.Value   := wAno;     
  dbseAnoFinal.Value     := wAno;     

  LstPatro    :=TStringList.Create;
  LstSitPlan  :=TStringList.Create;


// Preencher chkList da Patrocinadora
   qryPatro.Close;
   qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
   qryPatro.Open;
   CriaLista(ChkLstPatro,QryPatro,LstPatro,'IDPESSOA','NOME');
// Preencher chkList da Situação do Participante no Plano
   qrySitPlan.Close;
   qrySitPlan.Open;
   CriaLista(ChkLstSitPlan,QrySitPlan,LstSitPlan,'IDSITPLANOPREV','DESCRICAO');

   qryContrib.Close;
   qryContrib.Open;

end;

Procedure CriaLista(ChkList:TCheckListBox; Query:TwwQuery;
                           Lista: TStringList; Chave, Descricao:String);
Begin
  Lista.Clear;
  While Not Query.Eof Do Begin
    ChkList.Items.Add(Query.FieldByName(Descricao).AsString);
    Lista.Add(Query.FieldByName(Chave).AsString);
    Query.Next;
  End;
End;

procedure TfrmParamRelPartDeb.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  For I := 0 To ChkLstPatro.Items.Count - 1 Do
     ChkLstPatro.Checked[I] := False;

  For I := 0 To ChkLstSitPlan.Items.Count - 1 Do
     ChkLstSitPlan.Checked[I] := False;

  DecodeDate(Date, wAno, wMes, wDia);
  cbMesInicial.ItemIndex := wMes - 1; 
  cbMesFinal.ItemIndex   := wMes - 1; 
  dbseAnoInicial.Value   := wAno;     
  dbseAnoFinal.Value     := wAno;     
end;

procedure TfrmParamRelPartDeb.bbtnConfirmarClick(Sender: TObject);
Var
  I     : Integer;
  wMes1,           
  wMes2 : String;  
begin
  inherited;
  SPatro:='';
  SSitPlan:='';

  // Criticar Dados
  If cbMesInicial.ItemIndex = -1 Then
  Begin
    MsgDlg('Mês de Cobrança do período inicial não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
    cbMesInicial.SetFocus;
    Exit;
  End;

  If dbseAnoInicial.Value = 0 Then
  Begin
    MsgDlg('Ano de Cobrança do período inicial não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
    dbseAnoInicial.Value := wAno;
    dbseAnoInicial.SetFocus;
    Exit;
  End;

  If cbMesFinal.ItemIndex = -1 Then
  Begin
    MsgDlg('Mês de Cobrança do período final não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
    cbMesFinal.SetFocus;
    Exit;
  End;

  If dbseAnoFinal.Value = 0 Then
  Begin
    MsgDlg('Ano de Cobrança do período final não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
    dbseAnoFinal.Value := wAno;
    dbseAnoFinal.SetFocus;
    Exit;
  End;

  // Preenche variáveis de início (wMes1) e fim (wMes2)
  If (cbMesInicial.ItemIndex+1) <= 9 Then
    wMes1 := Trim(dbseAnoInicial.Text)+'/0'+IntToStr(cbMesInicial.ItemIndex+1)
  Else
    wMes1 := Trim(dbseAnoInicial.Text)+'/'+IntToStr(cbMesInicial.ItemIndex+1);

  If (cbMesFinal.ItemIndex+1) <= 9 Then
    wMes2 := Trim(dbseAnoFinal.Text)+'/0'+IntToStr(cbMesFinal.ItemIndex+1)
  Else
    wMes2 := Trim(dbseAnoFinal.Text)+'/'+IntToStr(cbMesFinal.ItemIndex+1);

  For I := 0 To ChkLstPatro.Items.Count - 1 Do
    begin
      If ChkLstPatro.Checked[I] = True then
         SPatro := SPatro + LstPatro.Strings[I]+',';
    end;

  For I := 0 To ChkLstSitPlan.Items.Count - 1 Do
    begin
      If ChkLstSitPlan.Checked[I] = True Then
         SSitPlan := SSitPlan + LstSitPlan.Strings[I]+',';
    end;

  SPatro := Trim(Copy(SPatro,1,((Length(SPatro)-1))));
  SSitPlan := Trim(Copy(SSitPlan,1,((Length(SSitPlan)-1))));

  ssql:= 'SELECT   HCP.IDPESSJUR,           HCP.IDPESSOA, PJ.NOME AS PATROCINADORA,  PFL.NOME AS FILIAL,    '+ vQl +
           '       SP.DESCRICAO AS SITPLAN, SF.DESCRICAO AS SITPAT,    SPART.IDSITPART,       '+ vQl +
           '       SPART.FLGINTERNO,        HCP.MESCOBRANCA,           HCP.MESREFERENCIA,     '+ vQl +
           '       EP.MATRICULA,            HCP.IDPESSOA,              P.NOME AS PARTICIPANTE,'+ vQl +
           '       SUBSTR(HCP.MESREFERENCIA,6,2)||SUBSTR(HCP.MESREFERENCIA,5,1)||SUBSTR(HCP.MESREFERENCIA,1,4) AS MES, '+ vQl +
           '       C.NOMERESUM AS CONTRIBUICAO,  HCP.VALORESPERADO,         PPP.SALMANTIDO, '+ vQl +
           '       PPP.SALPARTICIPACAO, HCP.IDPLANOPREV                                                 '+ vQl +
           'FROM   PESSOA PJ,  PESSOA PFL,      PESSOA P, HSTCONTRIBPREV HCP, ELEGPATRO EP,  '+ vQl +
           '       SITFUNC SF, SITPLANOPREV SP, SITPART SPART, PARTPREVPLAN PPP, '+ vQl +
           '       PATRO PT, CONTRIBUICAO C '+ vQl +
           'WHERE (HCP.MESCOBRANCA >= '''+wmes1+''') '+ vQl+  
           'AND   (HCP.MESCOBRANCA <= '''+wmes2+''') '+ vQl+  
           'AND   (PT.IDPESSOA     = HCP.IDPESSJUR) '+ vQl+
           'AND   (PT.IDFUNDACAO   = '+IntToStr(iIdFundacao)+') '+ vQl;

  if (sPatro <> '')
  then ssql := ssql + 'AND (HCP.IDPESSJUR IN ('+sPatro+')) '+ vQl;
  if (sSitPlan <> '')
  then ssql := ssql + 'AND (SP.IDSITPLANOPREV IN ('+sSitPlan+'))  '+ vQl;
  if Trim(dbcContribuicao.Text) <> ''
  then ssql := ssql + 'AND (HCP.IDCONTRIBUICAO = '+
               qryContrib.FieldByName('IDCONTRIBUICAO').AsString +')  '+ vQl;
  ssql := ssql +'AND   (HCP.VALORRECEBIDO  IS NULL ) '+ vQl +
                'AND   (HCP.FLGDEVOLUCAO   = 0 ) '+ vQl +
                'AND   (HCP.IDPESSOA       = EP.IDPESSOA) '+ vQl +
                'AND   (HCP.IDPESSJUR      = EP.IDPESSJUR) '+ vQl +
                'AND   (EP.IDPESSJUR       = PJ.IDPESSOA) '+ vQl +
                'AND   (EP.IDESTAB         = PFL.IDPESSOA(+)) '+ vQl +
                'AND   (EP.IDPESSOA        = P.IDPESSOA) '+ vQl +
                'AND   (EP.IDSITFUNC       = SF.IDSITFUNC) '+ vQl +
                'AND   (HCP.IDPESSJUR      = PPP.IDPESSJUR) '+ vQl +
                'AND   (HCP.IDPLANOPREV    = PPP.IDPLANOPREV) '+ vQl +
                'AND   (HCP.IDPESSOA       = PPP.IDPESSOA) '+ vQl +
                'AND   (HCP.SEQPROPOSTA    = 1) '+ vQl +
                'AND   (PPP.IDSITPLANOPREV = SP.IDSITPLANOPREV) '+ vQl +
                'AND   (HCP.IDCONTRIBUICAO = C.IDCONTRIBUICAO) '+ vQl +
                'AND   (PPP.IDSITPART      = SPART.IDSITPART) '+ vQl +
                'ORDER BY PJ.NOME, SP.DESCRICAO, EP.MATRICULA, HCP.MESCOBRANCA, ' + vQl + 
                '         HCP.MESREFERENCIA, C.NOMERESUM ';

    Fazquery(dtmRelatAdmPrev.qryPartDeb,ssql);

    dtmRelatAdmPrev.qryFundacao.Close;
    dtmRelatAdmPrev.qryFundacao.ParamByName('pFundacao').asinteger;
    dtmRelatAdmPrev.qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
    dtmRelatAdmPrev.qryFundacao.Prepare;
    dtmRelatAdmPrev.qryFundacao.Open;

end;

procedure TfrmParamRelPartDeb.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPatro.Close;
  qrySitPlan.Close;
end;

end.

