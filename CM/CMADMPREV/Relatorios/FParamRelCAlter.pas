// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 07.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO 
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo
// Data        : 08/10/2002
// Alteração   : função dsuper  e trazultdiames agora chamada da funcoesuteis
//------------------------------------------------------------------------------

unit FParamRelCAlter;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Mask, Db, DBTables, Wwquery,
  wwdbdatetimepicker, CMDateTimePicker, CheckLst, ComCtrls, {DBCtrlt}
  Machklb;

type
  TfrmParamRelCAlter = class(TfrmOkCancelar)
    pgCtrlParamRelCAlter: TPageControl;
    tbshtParticipante: TTabSheet;
    tbshtPatro: TTabSheet;
    gpbProcura: TGroupBox;
    lblPartiticpante: TLabel;
    bbtnProcurar: TBitBtn;
    lblPlano: TLabel;
    edPlano: TEdit;
    lblNome: TLabel;
    edNomePart: TEdit;
    lblMatricula: TLabel;
    edMatricula: TEdit;
    lblInscricao: TLabel;
    edInscricao: TEdit;
    MontaSelect1: TMontaSelect;
    grbPatro: TGroupBox;
    bbtnPatroTodas: TBitBtn;
    bbtnPatroInverte: TBitBtn;
    qryPatro: TwwQuery;
    ChkLstPatro: TCheckListBox;
    grbFaixa: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtedInicial: TCMDateTimePicker;
    dtedFinal: TCMDateTimePicker;
    procedure bbtnPatroTodasClick(Sender: TObject);
    procedure bbtnPatroInverteClick(Sender: TObject);
    procedure dtedInicialExit(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ChkLstPatroClickCheck(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure CriaLista(ChkList:TCheckListBox; Query:TwwQuery;
            Lista: TStringList; Chave, Descricao:String);
    Function Checado:Boolean;
  end;

var
  frmParamRelCAlter: TfrmParamRelCAlter;
  LstPatro:TStringList;
  i : integer;
  sPatro : String;
  wDia,wMes,wAno : Word;
  sIdPessJur, sIdPessoa, sIdPlanoPrev : string;


implementation

uses DRelatAdmPrev, UAdmPrev, UMensErro, UFuncoesUteis;

{$R *.DFM}


Procedure TfrmParamRelCAlter.CriaLista(ChkList:TCheckListBox; Query:TwwQuery;
	            Lista: TStringList; Chave, Descricao:String);
begin
  Lista.Clear;
  With query do
  begin
    While not Eof do
    begin
      ChkList.Items.Add(' '+Query.FieldByName(Descricao).AsString);
      Lista.Add(FieldByName(Chave).AsString);
      Next;
    end;
  end;
end;

procedure TfrmParamRelCAlter.bbtnPatroTodasClick(Sender: TObject);
begin
  inherited;
  for i := 0 to ChkLstPatro.Items.Count - 1 do
     ChkLstPatro.Checked[I] := True;
  tbshtParticipante.TabVisible := False;
end;

procedure TfrmParamRelCAlter.bbtnPatroInverteClick(Sender: TObject);
begin
  inherited;
  for i := 0 to ChkLstPatro.Items.Count - 1 do
     ChkLstPatro.Checked[i] := Not ChkLstPatro.Checked[i];

  If Checado=True Then Begin
    tbshtParticipante.TabVisible := False;
  End Else Begin
    tbshtParticipante.TabVisible := True;
  End;
end;

procedure TfrmParamRelCAlter.dtedInicialExit(Sender: TObject);
begin
  inherited;
  if dtedInicial.Text <> '' then
  begin
    DecodeDate(dtedInicial.Date,wAno,wMes,wDia);
    dtedFinal.Text := IntToStr(Trazultdiames(wMes,wAno))+copy(dtedInicial.text,3,8);
  end;

end;

procedure TfrmParamRelCAlter.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelect1.Executar;
  if MontaSelect1.RetornouValor then
  begin
     edNomePart.Text      := MontaSelect1.ValoresChave[0];
     edMatricula.Text     := MontaSelect1.ValoresChave[1];
     edInscricao.Text     := MontaSelect1.ValoresChave[2];
     edPlano.Text         := MontaSelect1.ValoresChave[3];
     sIdPessoa            := MontaSelect1.ValoresChave[4];
     sIdPlanoPrev         := MontaSelect1.ValoresChave[5];
     sIdPessJur           := MontaSelect1.ValoresChave[6];
  end
  else
  begin
     edNomePart.Text      := '';
     edMatricula.Text     := '';
     edInscricao.Text     := '';
     edPlano.Text         := '';
     sIdPessJur           := '-1';
     sIdPessoa            := '-1';
     sIdPlanoPrev         := '-1';
  end;
  tbshtPatro.TabVisible := False;
end;

procedure TfrmParamRelCAlter.FormShow(Sender: TObject);
begin
  inherited;
  LstPatro := TStringList.Create;
  MontaSelect1.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 

  qryPatro.Close;
  qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryPatro.Open;

  CriaLista(ChkLstPatro,qryPatro,LstPatro,'IDPESSOA','NOME');
end;

Function TfrmParamRelCAlter.Checado:Boolean;
Begin
  Checado:=False;
  for i := 0 to ChkLstPatro.Items.Count - 1 do
     if ChkLstPatro.Checked[i] then
       Checado:=True;
End;

procedure TfrmParamRelCAlter.ChkLstPatroClickCheck(Sender: TObject);
begin
  inherited;
  If Checado=True Then Begin
    tbshtParticipante.TabVisible := False;
  End Else Begin
    tbshtParticipante.TabVisible := True;
  End;

end;

procedure TfrmParamRelCAlter.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  for i := 0 to ChkLstPatro.Items.Count - 1 do
     ChkLstPatro.Checked[I] := False;
  dtedInicial.Text:='';
  dtedFinal.Text  :='';
  edNomePart.Text   := '';
  edMatricula.Text  := '';
  edInscricao.Text  := '';
  edPlano.Text      := '';

  sIdPessJur        := '-1';
  sIdPessoa         := '-1';
  sIdPlanoPrev      := '-1';
  tbshtParticipante.TabVisible := True;
  tbshtPatro.TabVisible        := True;
end;

procedure TfrmParamRelCAlter.bbtnConfirmarClick(Sender: TObject);
Var
  sEnd, ssql :String;
begin
  inherited;
  sPatro := '';

  if (Not Checado) And (Trim(edPlano.Text) = '') then
  begin
    MsgDlg('Falta informar Patrocinadora ou Participante. ','Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  end;


// Critica de data
  if dtedInicial.Text = '' then
  begin
    MsgDlg('Data inicial não preenchida. ','Erro',mtError,[mbOk,mbHelp],0);
    dtedInicial.SetFocus;
    exit;
  end;

  if dtedFinal.Text = '' then
  begin
    MsgDlg('Data final não preenchida. ','Erro',mtError,[mbOk,mbHelp],0);
    dtedFinal.SetFocus;
    exit;
  end;

  if StrToDate(dtedInicial.Text) > StrToDate(dtedFinal.Text) then
  begin
    MsgDlg('Data inicial posterior a data final . ','Erro',mtError,[mbOk,mbHelp],0);
    dtedInicial.SetFocus;
    exit;
  end;

//Obter dados da Fundação
  with dtmRelatAdmPrev do
  begin
    qryFundacao.Close;
    qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
    qryFundacao.Prepare;
    qryFundacao.Open;

//  Montar Endereço  e  Bairro/Cidade/Estado
    sEnd := trim(qryFundacao.FieldByName('LOGRADOURO').asstring) + ', ' +
            trim(qryFundacao.FieldByName('NUMERO').asstring);
    if trim(qryFundacao.FieldByName('COMPLEMENTO').asstring) <> '' then
       sEnd := sEnd + trim(qryFundacao.FieldByName('COMPLEMENTO').asstring);

// Escolher query para alimentar relatório
    if tbshtPatro.TabVisible = True then
    begin
      For i := 0 to ChkLstPatro.Items.Count - 1 do
      begin
        if ChkLstPatro.Checked[I] = True then
           sPatro := sPatro + LstPatro.Strings[I]+',';
      end;

      sPatro := Trim(Copy(sPatro,1,((Length(sPatro)-1))));

      ssql := 'SELECT PJ.NOME AS PATRO , '+
              'EL.MATRICULA, '+
              'P.NOME, '+
              'DECODE(L.OPERACAO,''U'', ''Alteração'',''D'', ''Exclusão'') as operacao, '+
              'L.DATAHORA, '+
              'L.NOMECAMPO, '+
              'L.VALORANTERIOR, '+
              'L.VALORATUAL, '+
              'US.NOMEUSUARIO, '+
              'L.IDPESSOA ' +
              'FROM   PESSOA P, PESSOA PJ, PATRO PT, PARTPREVPLAN PPP,  ELEGPATRO EL, LOGCBANCARIA L ,USUARIOSISTEMA US '+
              'WHERE  (TO_CHAR(L.DATAHORA, ''DD/MM/YYYY'') >= '+QuotedStr(dtedInicial.Text)+') '+
              'AND    (TO_CHAR(L.DATAHORA, ''DD/MM/YYYY'') <= '+QuotedStr(dtedFinal.Text)+') '+
              'AND    (EL.IDPESSJUR  IN ('+sPatro+')) '+
              'AND    PT.IDPESSOA = EL.IDPESSJUR '+           
              'AND    PT.IDFUNDACAO = '+IntToStr(iIdFundacao)+
              'AND    (UPPER(L.NOMECAMPO) LIKE ''IDAGENCIA'' ' +
              '       OR UPPER(L.NOMECAMPO) LIKE ''CONTACORRENTE'' '+
              '       OR UPPER(L.NOMECAMPO) LIKE ''FLGCONTAPREF'' '+
              '       OR UPPER(L.NOMECAMPO) LIKE ''FLGCONTACONJUNTA'' '+
              '       OR UPPER(L.NOMECAMPO) LIKE ''TIPOCONTA'' ) ' +
              'AND    (P.IDPESSOA = EL.IDPESSOA) '+
              'AND    (PJ.IDPESSOA = EL.IDPESSJUR) '+
              'AND    (L.IDPESSOA = EL.IDPESSOA) '+
              'AND    (EL.IDPESSJUR = PPP.IDPESSJUR) '+
              'AND    (EL.IDPESSOA = PPP.IDPESSOA) '+
              'AND    (PPP.SEQPROPOSTA = 1) '+
              'AND    (SUBSTR(L.USUARIO,3,LTRIM(RTRIM(LENGTH(L.USUARIO)))) = US.IDUSUARIO) '+
              'ORDER BY '+
              'P.NOME, L.DATAHORA ';
      qryCAlter.Sql.Clear;
      qryCAlter.Sql.Add(ssql);
      qryCAlter.Open;
    end
    else
    begin
      ssql := 'SELECT PJ.NOME AS PATRO , '+
              'EL.MATRICULA, '+
              'P.NOME, '+
              'DECODE(L.OPERACAO,''U'', ''Alteração'',''D'', ''Exclusão'') as operacao, '+
              'L.DATAHORA, '+
              'L.NOMECAMPO, '+
              'L.VALORANTERIOR, '+
              'L.VALORATUAL, '+
              'US.NOMEUSUARIO, '+
              'L.IDPESSOA '+
              'FROM   PESSOA P, PESSOA PJ, PATRO PT, PARTPREVPLAN PPP,  ELEGPATRO EL, LOGCBANCARIA L, USUARIOSISTEMA US '+
              'WHERE  (TO_CHAR(L.DATAHORA, ''DD/MM/YYYY'') >= '+QuotedStr(dtedInicial.Text)+') '+
              'AND    (TO_CHAR(L.DATAHORA, ''DD/MM/YYYY'') <= '+QuotedStr(dtedFinal.Text)+') '+
              'AND    (EL.IDPESSOA = '+sIdpessoa+') ' +
              'AND    (EL.IDPESSJUR = '+sIdpessjur+') ' +
              'AND    PT.IDPESSOA = EL.IDPESSJUR '+           
              'AND    PT.IDFUNDACAO = '+IntToStr(iIdFundacao)+
              'AND    (PPP.IDPLANOPREV  = '+sIdplanoprev+') '+
              'AND    (UPPER(L.NOMECAMPO) LIKE ''IDAGENCIA'' ' +
              '       OR UPPER(L.NOMECAMPO) LIKE ''CONTACORRENTE'' '+
              '       OR UPPER(L.NOMECAMPO) LIKE ''FLGCONTAPREF'' '+
              '       OR UPPER(L.NOMECAMPO) LIKE ''FLGCONTACONJUNTA'' '+
              '       OR UPPER(L.NOMECAMPO) LIKE ''TIPOCONTA'' ) ' +
              'AND    (P.IDPESSOA = EL.IDPESSOA) '+
              'AND    (PJ.IDPESSOA = EL.IDPESSJUR) '+
              'AND    (L.IDPESSOA = EL.IDPESSOA) '+
              'AND    (EL.IDPESSJUR = PPP.IDPESSJUR) '+
              'AND    (EL.IDPESSOA = PPP.IDPESSOA) '+
              'AND    (PPP.SEQPROPOSTA = 1) '+
              'AND    (SUBSTR(L.USUARIO,3,LTRIM(RTRIM(LENGTH(L.USUARIO)))) = US.IDUSUARIO) '+
              'ORDER BY '+
              'P.NOME, L.DATAHORA ';
      qryCAlter.Sql.Clear;
      qryCAlter.Sql.Add(ssql);
      qryCAlter.Open;
    end;
    rpCAlterlbldtInicial.Caption := Trim(dtedInicial.Text);
    rpCAlterlbldtFinal.Caption := Trim(dtedFinal.Text);
  end;
end;

end.
