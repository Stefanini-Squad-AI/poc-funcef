// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 07.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO 
//------------------------------------------------------------------------------
unit FParamRelHstContribReg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwquery, Wwdatsrc, StdCtrls, Mask, wwdbedit,
  Wwdotdot, Wwdbcomb, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, checklst, Wwdbspin;

type
  TfrmParamRelHstContribReg = class(TfrmOkCancelar)
    Regional: TGroupBox;
    qryRegionais: TwwQuery;
    rgTipoRel: TRadioGroup;
    qryPatro: TwwQuery;
    ChkLstReg: TCheckListBox;
    bbtnTodas: TBitBtn;
    bbtnInverte: TBitBtn;
    GroupBox1: TGroupBox;
    dbseano: TwwDBSpinEdit;
    cbmes: TComboBox;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnTodasClick(Sender: TObject);
    procedure bbtnInverteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  Procedure CriaLista(ChkList:TCheckListBox; Query:TwwQuery;
            Lista: TStringList; Chave, Descricao:String);

var
  frmParamRelHstContribReg: TfrmParamRelHstContribReg;
  sSql, SReg :String;
  LstReg :TStringList;
  I:Integer;
  wDia,wMes,wAno : Word;

implementation

uses UMensErro, UAdmPrev, DRelatAdmPrev, UDataBase;

{$R *.DFM}

procedure TfrmParamRelHstContribReg.bbtnConfirmarClick(Sender: TObject);
var   sIdRubrica,wMesAno : string;
begin
  inherited;
  SReg:='';
  if (cbMes.ItemIndex+1) <= 9 then
     wMesAno := Trim(dbseano.Text)+'/0'+IntToStr(cbMes.ItemIndex+1)
  else
     wMesAno := Trim(dbseano.Text)+'/'+IntToStr(cbMes.ItemIndex+1);

  For I := 0 To ChkLstReg.Items.Count - 1 Do
  begin
    If ChkLstReg.Checked[I] = True then
       SReg := SReg + LstReg.Strings[I]+',';
  end;
  SReg := Trim(Copy(SReg,1,((Length(SReg)-1))));

  if  cbMes.ItemIndex = -1 then
  begin
      MsgDlg('Mês de Referência não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
      cbMes.SetFocus;
  end
  else if dbseAno.Value = 0 then
  begin
      MsgDlg('Ano de Referência não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
      dbseAno.Value := wAno;
      dbseano.SetFocus;
  end
  else if SReg = '' then
  begin
     MsgDlg('Selecione a Regional','Erro',mtError,[mbOk,mbHelp],0);
     ChkLstReg.SetFocus;
  end;

  qryPatro.Close;
  qryPatro.ParamByName('IdPessJur').AsInteger := qryRegionais.Fieldbyname('IDPESSJUR').AsInteger;
  qryPatro.Open;

  sIdRubrica := qryPatro.FieldByName('IdRubSalParticip').AsString;

  with dtmRelatAdmPrev do
  begin
     qryFundacao.Close;
     qryFundacao.ParamByName('pFundacao').asinteger;
     qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
     qryFundacao.Prepare;
     qryFundacao.Open;

     if rgTipoRel.ItemIndex = 0 then
     begin
        sSql :='SELECT P.NOME AS NOMEPARTICIP, C.NOME AS NOMECONTRIB, PAT.NOME AS NOMEPATRO,   '+
               '       PL.NOME AS NOMEPLANO, HST.MESREFERENCIA,HST.MESCOBRANCA,HST.VALORESPERADO,'+
               '       HST.VALORRECEBIDO,HST.FLGCALCRESERVA,DECODE(HST.FLGDIVERGENTE,0,''Não'',''Sim''),'+
               '       DECODE(HST.FLGDEVOLUCAO,0,''Não'',''Sim''),EL.MATRICULA,EL.DATAADMISSAO,'+
               '       PP.INSCRICAONUMERO,PP.INSCRICAODATA, EL.IDESTAB, P2.NOME AS REGIONAL,'+
               '       PF.DATANASC,PP.DTINICIOINSC,HRUB.VALORPROVENTO, HST.DATARECEBIMENTO,CT.VALORBASE1,'+
               '       DECODE(HST.SITRECEBIMENTO, 0,''Não Enviadas'','+
               '                   1, ''Não Recebidas'','+
               '                   2, ''Recebidas sem Divergência'','+
               '                   3, ''Recebidas com Divergência(NT)'','+
               '                   4, ''Recebidas com Divergência(T)'','+
               '                   5, ''Divergência Tratada e Paga'','+
               '                   6, ''Divergência Tratada Não Paga'','+
               '                   7, ''Financiadas ou Renegociadas'','+
               '                   8, ''Canceladas'','+
               '                   9, ''Atrasadas a cobrar na Folha Benef. '','+
               '                   ''Outros'') '+
               'FROM   PESSOA P, PESSOA P2,    CONTRIBUICAO C,        HSTCONTRIBPREV HST, '+
               '       ELEGPATRO EL,           PARTPREVPLAN PP,       PLANPREV PL, '+
               '       PESSOA PAT,             HISTRUBSAL HRUB, PESSOAFISICA PF, CONTRIBPREVPARTP CT, '+
               '       PATRO PT '+
               'WHERE  (EL.IDPESSJUR IN (SELECT DISTINCT EL.IDPESSJUR          '+
               '                         FROM   PESSOA P2,  ELEGPATRO EL       '+
               '                         WHERE (P2.IDPESSOA = EL.IDESTAB)      '+
               '                         AND   (EL.IDESTAB IN ('+SReg+'))))    '+
               'AND    (EL.IDESTAB IN ('+SReg+'))                              '+
               'AND    (P.IDPESSOA   = EL.IDPESSOA)                            '+
               'AND    (PF.IDPESSOA  = P.IDPESSOA)                             '+
               'AND    (EL.IDPESSJUR = PAT.IDPESSOA)                           '+
               'AND    (PT.IDPESSOA  = EL.IDPESSJUR)                           '+
               'AND    (PT.IDFUNDACAO = '+IntToStr(iIdFundacao)+')            '+ 
               'AND    (P2.IDPESSOA = EL.IDESTAB)                              '+
               'AND    (PP.IDPESSJUR = EL.IDPESSJUR)                           '+
               'AND    (PP.IDPESSOA  = EL.IDPESSOA)                            '+
               'AND    (PP.IDPLANOPREV = PL.IDPLANOPREV)                       '+
               'AND    (HST.IDPESSOA   = P.IDPESSOA)                           '+
               'AND    (HST.IDCONTRIBUICAO = C.IDCONTRIBUICAO)                 '+
               'AND    (CT.IDPESSJUR = PP.IDPESSJUR)                           '+
               'AND    (CT.IDPESSOA = PP.IDPESSOA)                             '+
               'AND    (CT.IDPLANOPREV = PP.IDPLANOPREV)                       '+
               'AND    (CT.IDCONTRIBUICAO = HST.IDCONTRIBUICAO)                '+
               'AND    (CT.SEQPROPOSTA = PP.SEQPROPOSTA)                       '+
               'AND    (HRUB.IDRUBRICA(+)  = '''+sIdRubrica+''')               '+
               'AND    (HRUB.IDPESSOA(+)   = HST.IDPESSOA)                     '+
               'AND    (HRUB.IDPESSJUR(+)  = HST.IDPESSJUR)                    '+
               'AND    (HRUB.MES(+) = HST.MESREFERENCIA)                       '+
               'AND    (HST.MESREFERENCIA = '''+wMesAno+''')                   '+
               'ORDER BY P2.NOME, P.NOME, HST.MESREFERENCIA, C.NOME            ';

        Fazquery(dtmRelatAdmPrev.qryHstContribReg,sSql);

     end
     else
     begin
        sSql := 'SELECT P.NOME AS NOMEPARTICIP, C.NOME AS NOMECONTRIB, PAT.NOME AS NOMEPATRO,' +
               'PL.NOME AS NOMEPLANO,HST.MESREFERENCIA,HST.MESCOBRANCA,HST.VALORESPERADO, ' +
               'HST.VALORRECEBIDO,HST.FLGCALCRESERVA,DECODE(HST.FLGDIVERGENTE,0,''Não'',''Sim''), ' +
       'DECODE(HST.FLGDEVOLUCAO,0,''Não'',''Sim''),EL.MATRICULA,EL.DATAADMISSAO,PP.INSCRICAONUMERO, ' +
       'PP.INSCRICAODATA, EL.IDESTAB, P2.NOME AS REGIONAL, PF.DATANASC, ' +
       'PP.DTINICIOINSC,	       HRUB.VALORPROVENTO, HST.DATARECEBIMENTO,CT.VALORBASE1, ' +
       'DECODE(HST.SITRECEBIMENTO, 0, ''Não Enviadas'', ' +
       '                           1, ''Não Recebidas'', ' +
       '                           2, ''Recebidas sem Divergência'', ' +
       '                           3, ''Recebidas com Divergência(NT)'', ' +
       '                           4, ''Recebidas com Divergência(T)'', ' +
       '                           5, ''Divergência Tratada e Paga'', ' +
       '                           6, ''Divergência Tratada Não Paga'', ' +
       '                           7, ''Financiadas ou Renegociadas'', ' +
       '                           8, ''Canceladas'',' +
       '                           9, ''Atrasadas a cobrar na Folha Benef. '', ' +
       '                           ''Outros'') ' +
       'FROM   PESSOA P, PESSOA P2,    CONTRIBUICAO C,        HSTCONTRIBPREV HST, ' +
       '       ELEGPATRO EL,           PARTPREVPLAN PP,       PLANPREV PL, ' +
       '       PESSOA PAT,             HISTRUBSAL HRUB, PESSOAFISICA PF, CONTRIBPREVPARTP CT, ' +
       '       PATRO PT '+
       'WHERE  (EL.IDPESSJUR IN (SELECT DISTINCT EL.IDPESSJUR ' +
       '                         FROM   PESSOA P2,  ELEGPATRO EL ' +
       '                         WHERE (P2.IDPESSOA = EL.IDESTAB) ' +
       '                         AND   (EL.IDESTAB IN ('+SReg+')))) ' +
       'AND    (EL.IDESTAB IN ('+SReg+')) ' +
       'AND    (P.IDPESSOA   = EL.IDPESSOA) ' +
       'AND    (PF.IDPESSOA  = P.IDPESSOA) ' +
       'AND    (EL.IDPESSJUR = PAT.IDPESSOA) ' +
       'AND    (PT.IDPESSOA  = EL.IDPESSJUR)                           '+
       'AND    (PT.IDFUNDACAO = '+IntToStr(iIdFundacao)+')            '+ 
       'AND    (P2.IDPESSOA = EL.IDESTAB) ' +
       'AND    (PP.IDPESSJUR = EL.IDPESSJUR) ' +
       'AND    (PP.IDPESSOA  = EL.IDPESSOA) ' +
       'AND    (PP.IDPLANOPREV = PL.IDPLANOPREV) ' +
       'AND    (HST.IDPESSOA   = P.IDPESSOA) ' +
       'AND    (HST.IDCONTRIBUICAO = C.IDCONTRIBUICAO) ' +
       'AND    (CT.IDPESSJUR = PP.IDPESSJUR) ' +
       'AND    (CT.IDPESSOA = PP.IDPESSOA) ' +
       'AND    (CT.IDPLANOPREV = PP.IDPLANOPREV) ' +
       'AND    (CT.IDCONTRIBUICAO = HST.IDCONTRIBUICAO) ' +
       'AND    (CT.SEQPROPOSTA = PP.SEQPROPOSTA) ' +
       'AND    (HRUB.IDRUBRICA(+)  = '''+sIdRubrica+''') ' +
       'AND    (HRUB.IDPESSOA(+)   = HST.IDPESSOA) ' +
       'AND    (HRUB.IDPESSJUR(+)  = HST.IDPESSJUR) ' +
       'AND    (HRUB.MES(+) = HST.MESREFERENCIA) ' +
       'ORDER BY P2.NOME, P.NOME, HST.MESREFERENCIA, C.NOME ';

        Fazquery(dtmRelatAdmPrev.qryHstContribRegSin,sSql);

     end;


  end;
end;

procedure TfrmParamRelHstContribReg.FormShow(Sender: TObject);
begin
  inherited;
  DecodeDate(Date, wAno, wMes, wDia);
  cbMes.ItemIndex := wMes - 1;
  dbseAno.Value   := wAno;

  LstReg          := TStringList.Create;
  qryRegionais.close;
  qryRegionais.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
  qryRegionais.open;
  
  CriaLista(ChkLstReg,qryRegionais,LstReg,'IDESTAB','REGIONAL');
end;

Procedure CriaLista(ChkList:TCheckListBox; Query:TwwQuery;
                           Lista: TStringList; Chave, Descricao:String);
begin
  Lista.Clear;
  while Not Query.Eof Do Begin
    ChkList.Items.Add(Query.FieldByName(Descricao).AsString);
    Lista.Add(Query.FieldByName(Chave).AsString);
    Query.Next;
  end;
end;

procedure TfrmParamRelHstContribReg.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  For I := 0 To ChkLstReg.Items.Count - 1 Do
     ChkLstReg.Checked[I] := False;

  DecodeDate(Date, wAno, wMes, wDia);
  cbMes.ItemIndex := wMes - 1;
  dbseAno.Value   := wAno;
end;

procedure TfrmParamRelHstContribReg.bbtnTodasClick(Sender: TObject);
begin
  inherited;
  for i := 0 to ChkLstReg.Items.Count - 1 do
      ChkLstReg.checked[i]:= True;
end;

procedure TfrmParamRelHstContribReg.bbtnInverteClick(Sender: TObject);
begin
  inherited;
  for i := 0 to ChkLstReg.Items.Count - 1 do
     ChkLstReg.Checked[i] := Not ChkLstReg.Checked[i];
end;

end.

