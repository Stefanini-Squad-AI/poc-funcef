// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 07.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FParamRelPartInscMes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, wwdblook, CMDBLookupCombo, StdCtrls, checklst, Mask,
  wwdbedit, Wwdbspin, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, UDataBase;

type
  TfrmParamRelPartInscMes = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    dbseano: TwwDBSpinEdit;
    cbmes: TComboBox;
    GroupBox2: TGroupBox;
    chklstPatro: TCheckListBox;
    qryPatro: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRelPartInscMes: TfrmParamRelPartInscMes;
  i:integer;
  LstPatro:TStringList;
  SPatro,ssql:String;
  wDia,wMes,wAno : Word;
  
implementation

{$R *.DFM}

uses FParamRelPartDeb,UMensErro, dRelatAdmPrev, UAdmPrev;

procedure TfrmParamRelPartInscMes.FormShow(Sender: TObject);
begin
  inherited;
  DecodeDate(Date, wAno, wMes, wDia);
  cbMes.ItemIndex := wMes - 1;
  dbseAno.Value := wAno;

  LstPatro    :=TStringList.Create;

// Preencher chkList da Patrocinadora
   qryPatro.Close;
   qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
   qryPatro.Open;
   FParamRelPartDeb.CriaLista(ChkLstPatro,QryPatro,LstPatro,'IDPESSOA','NOME');

end;

procedure TfrmParamRelPartInscMes.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
// Zera chkList da Patrocinadora
  For I := 0 To ChkLstPatro.Items.Count - 1 Do
     ChkLstPatro.Checked[I] := False;

  DecodeDate(Date, wAno, wMes, wDia);
  cbMes.ItemIndex := wMes - 1;
  dbseAno.Value := wAno;
end;

procedure TfrmParamRelPartInscMes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPatro.Close;
end;

procedure TfrmParamRelPartInscMes.bbtnConfirmarClick(Sender: TObject);
Var
  I:Integer;
  wMes:String;
begin
  inherited;
      SPatro:='';

  if (cbMes.ItemIndex+1) <= 9 then
     wMes := '0'+IntToStr(cbMes.ItemIndex+1)+'/'+Trim(dbseano.Text)
  else
     wMes := IntToStr(cbMes.ItemIndex+1)+'/'+Trim(dbseano.Text);

  For I := 0 To ChkLstPatro.Items.Count - 1 Do
    begin
      If ChkLstPatro.Checked[I] = True then
         SPatro := SPatro + LstPatro.Strings[I]+',';
    end;

  SPatro := Trim(Copy(SPatro,1,((Length(SPatro)-1))));

// Criticar Dados
  if cbMes.ItemIndex = -1 then
    begin
     MsgDlg('Mês de Referência não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     cbMes.SetFocus;
     Exit;
    end
  else if  dbseAno.Value = 0 then
    begin
     MsgDlg('Ano de Referência não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     dbseAno.Value := wAno;
     dbseano.SetFocus;
     Exit;
    end
  else
    ssql:= 'SELECT  PF.NOME AS PARTICIPANTE, PJ.NOME AS PATROCINADORA, PFL.NOME AS FILIAL, '+
           '        EP.MATRICULA, PFC.DATANASC, EP.DATAADMISSAO, PPP.DTINICIOINSC, '+
           '        PPP.SALINSCRICAO, EP.TEMPOSERVANTERIOR, '+
           '        EP.NIVEL, CEXT.TITULO,  PPP.INSCRICAONUMERO, '+
           '        C.NOME, '+
           '        DECODE(CP.NOMEVALORBASE1,'''',''Opcao 1'',CP.NOMEVALORBASE1)AS NOMEVALORBASE1, '+
           '        DECODE(CP.NOMEVALORBASE2,'''',''Opcao 2'',CP.NOMEVALORBASE2)AS NOMEVALORBASE2, '+
           '        DECODE(CP.NOMEVALORBASE3,'''',''Opcao 3'',CP.NOMEVALORBASE3)AS NOMEVALORBASE3, '+
           '        CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3 '+
           'FROM     PESSOA PF, PESSOA PJ, PESSOA PFL, PATRO PT, ELEGPATRO EP, PESSOAFISICA PFC, '+
           '         PARTPREVPLAN PPP,     CONTRIBPREVPARTP CPP, CONTPREV CP, '+
           '         CONTRIBUICAO C,       EVENTOSPREV EV, EVENTOGERADOR EG , CARGOEXT CEXT '+
           'WHERE  (TO_CHAR(EV.DATAREGISTRO,''MM/YYYY'')= '''+wmes+''') '+
           'AND    (EG.FLGINTERNO = ''IP'' ) '+
           'AND    (CP.FLGPAGADOR <> ''E'' ) '+
           'AND    (PT.IDPESSOA   = EV.IDPESSJUR) '+             
           'AND    (PT.IDFUNDACAO = '+IntToStr(iIdFundacao)+')'; 

           if (sPatro <> '')
           then ssql := ssql + 'AND (PPP.IDPESSJUR IN ('+sPatro+')) ';

           sSQL := sSQL + 'AND   (EV.IDEVENTOGERADOR = EG.IDEVENTOGERADOR) '+
           'AND   (PPP.IDPESSJUR      = EV.IDPESSJUR) '+
           'AND   (PPP.IDPLANOPREV    = EV.IDPLANOPREV) '+
           'AND   (PPP.IDPESSOA       = EV.IDPESSOA) '+
           'AND   (PPP.SEQPROPOSTA    = EV.SEQPROPOSTA) '+
           'AND   (EP.IDPESSJUR = PJ.IDPESSOA)'+
           ' AND (EP.IDPESSOA        = PF.IDPESSOA)'+
           ' AND (EP.IDESTAB         = PFL.IDPESSOA(+) )'+
           ' AND (EP.IDPESSOA        = PFC.IDPESSOA)'+
           ' AND (EP.IDPESSJUR       = PPP.IDPESSJUR)'+
           ' AND (EP.IDPESSOA        = PPP.IDPESSOA)'+
           ' AND (PPP.SEQPROPOSTA    = 1)'+
           ' AND (CPP.IDPESSJUR      = PPP.IDPESSJUR)'+
           ' AND (CPP.IDPLANOPREV    = PPP.IDPLANOPREV)'+
           ' AND (CPP.IDPESSOA       = PPP.IDPESSOA)'+
           ' AND (CPP.SEQPROPOSTA    = PPP.SEQPROPOSTA)'+
           ' AND (CPP.IDPLANOPREV    = CP.IDPLANOPREV)'+
           ' AND (CPP.IDCONTRIBUICAO = CP.IDCONTRIBUICAO)'+
           ' AND (CP.IDCONTRIBUICAO  = C.IDCONTRIBUICAO)'+
           ' AND (CPP.FLGCOBRA       = 1)'+
           ' AND (EP.IDCARGOEXT      = CEXT.IDCARGOEXT(+) ) '+
           ' ORDER BY PPP.DTINICIOINSC, PF.NOME ';

    dtmRelatAdmPrev.mes.Caption  := cbmes.Text+'/'+dbseano.Text;
    Fazquery(dtmRelatAdmPrev.qryPartInscMes,ssql);

    dtmRelatAdmPrev.qryFundacao.Close;
    dtmRelatAdmPrev.qryFundacao.ParamByName('pFundacao').asinteger;
    dtmRelatAdmPrev.qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
    dtmRelatAdmPrev.qryFundacao.Prepare;
    dtmRelatAdmPrev.qryFundacao.Open;
end;

end.
