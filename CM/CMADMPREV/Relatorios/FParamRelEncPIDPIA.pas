// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 07.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FParamRelEncPIDPIA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwquery, StdCtrls, checklst, ExtCtrls, Mask,
  wwdbedit, Wwdbspin, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, wwdblook, CMDBLookupCombo, UDataBase;

type
  TfrmParamRelEncPIDPIA = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    dbseano: TwwDBSpinEdit;
    cbmes: TComboBox;
    GroupBox2: TGroupBox;
    chklstPatro: TCheckListBox;
    qrypatro: TwwQuery;
    GroupBox3: TGroupBox;
    dblkpPlanInc: TCMDBLookupCombo;
    qryPlanInc: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRelEncPIDPIA: TfrmParamRelEncPIDPIA;
  i:integer;
  LstPatro:TStringList;
  SPatro,ssql:String;
  wDia,wMes,wAno : Word;

implementation

uses FParamRelPartDeb,UMensErro, dRelatAdmPrev, UAdmPrev;

{$R *.DFM}

procedure TfrmParamRelEncPIDPIA.FormShow(Sender: TObject);
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
   qryPlanInc.open;   

end;

procedure TfrmParamRelEncPIDPIA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPatro.Close;
end;

procedure TfrmParamRelEncPIDPIA.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  For I := 0 To ChkLstPatro.Items.Count - 1 Do
     ChkLstPatro.Checked[I] := False;

  DecodeDate(Date, wAno, wMes, wDia);
  cbMes.ItemIndex := wMes - 1;
  dbseAno.Value := wAno;
end;

procedure TfrmParamRelEncPIDPIA.bbtnConfirmarClick(Sender: TObject);
Var
  I:Integer;
  wMes:String;
begin
  inherited;
  SPatro:='';

  if (cbMes.ItemIndex+1) <= 9 then
     wMes := Trim(dbseano.Text)+'/0'+IntToStr(cbMes.ItemIndex+1)
  else
     wMes := Trim(dbseano.Text)+'/'+IntToStr(cbMes.ItemIndex+1);

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
    ssql:= ' SELECT  PJ.NOME AS PATROCINADORA, '+
           '         PFL.NOME AS FILIAL, '+
           '         EP.MATRICULA, '+
           '         EP.IDPESSOA, '+
           '         PF.NOME AS PARTICIPANTE, '+
           '         C.NOME AS CONTRIBUICAO, '+
           '         HCP.MESREFERENCIA, '+
           '         SUBSTR(HCP.MESREFERENCIA,6,2)||SUBSTR(HCP.MESREFERENCIA,5,1)||SUBSTR(HCP.MESREFERENCIA,1,4) AS MES, '+
           '         HCP.VALORRECEBIDO, '+
           '         B.NOME AS BENEFICIO, '+
           '         EPV.DATAVOLTA '+
           ' FROM    HSTCONTRIBPREV HCP, '+
           '         ELEGPATRO EP, '+
           '         PESSOA PJ, '+
           '         PESSOA PF, '+
           '         PESSOA PFL, '+
           '         CONTRIBUICAO C, '+
           '         PATRO PT,    '+ 
           '         SITFUNC SF, '+
           '         EVENTOSPREV EPV, '+
           '         BENEFICIO  B '+
           ' WHERE (TO_CHAR(EPV.DATAEFETIVADO , ''YYYY/MM'') = '''+wmes+''') '+
           ' AND   (PT.IDPESSOA = HCP.IDPESSJUR) '+               
           ' AND   (PT.IDFUNDACAO = '+IntToStr(iIdFundacao)+')';  
    if (sPatro <> '') then
       ssql := ssql + 'AND (EPV.IDPESSJUR IN ('+sPatro+')) ';
    if trim(dblkpPlanInc.text) <> '' then
       ssql:=ssql + 'AND (EPV.IDSITFUNCNOVO = '''+dblkpPlanInc.lookupvalue+''')' ;
           ssql:=ssql + 'AND  (HCP.IDPESSOA = EP.IDPESSOA) '+
           'AND  (EPV.SEQPROPOSTA = 1) '+
           'AND   (EPV.IDPESSOA = EP.IDPESSOA) '+
           'AND   (EPV.IDPESSJUR = EP.IDPESSJUR) '+
           'AND  (EPV.IDBENEFICIO = B.IDBENEFICIO) '+
           'AND  (HCP.MESREFERENCIA = '''+wmes+''') '+
           'AND  (HCP.IDPESSOA = EPV.IDPESSOA) '+
           'AND  (HCP.IDPESSJUR = EPV.IDPESSJUR) '+
           'AND  (HCP.IDPLANOPREV = EPV.IDPLANOPREV) '+
           'AND  (HCP.IDCONTRIBUICAO = C.IDCONTRIBUICAO) '+
           'AND  (EP.IDESTAB = PFL.IDPESSOA) '+
           'AND  (EP.IDPESSJUR = PJ.IDPESSOA) '+
           'AND  (EP.IDPESSOA = PF.IDPESSOA) '+
           'ORDER BY '+
           'PJ.NOME, '+
           'EP.MATRICULA, '+
           'HCP.MESREFERENCIA';


    dtmRelatAdmPrev.lbmes.Caption  := cbmes.Text+'/'+dbseano.Text;
    dtmRelatAdmPrev.titrelat.Caption  := 'RELATÓRIO DE ENCERRAMENTO DE'+
                                         qryPlanInc.FieldByName('DESCRICAO').AsString;

    Fazquery(dtmRelatAdmPrev.qryEncPIDPIA,ssql);

    dtmRelatAdmPrev.qryFundacao.Close;
    dtmRelatAdmPrev.qryFundacao.ParamByName('pFundacao').asinteger;
    dtmRelatAdmPrev.qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
    dtmRelatAdmPrev.qryFundacao.Prepare;
    dtmRelatAdmPrev.qryFundacao.Open;
end;


end.
