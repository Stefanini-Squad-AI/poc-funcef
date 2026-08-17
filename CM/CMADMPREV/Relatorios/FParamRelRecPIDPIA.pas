unit FParamRelRecPIDPIA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, checklst, Mask, wwdbedit, Wwdbspin, Db,
  DBTables, Wwquery,UDataBase, Wwdatsrc, wwdblook;

type
  TfrmParamRelRecPIDPIA = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    dbseano: TwwDBSpinEdit;
    cbmes: TComboBox;
    GroupBox2: TGroupBox;
    chklstPatro: TCheckListBox;
    qrypatro: TwwQuery;
    GroupBox3: TGroupBox;
    dbcmbSitFunc: TwwDBLookupCombo;
    dsSitFunc: TwwDataSource;
    qrySitFunc: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRelRecPIDPIA: TfrmParamRelRecPIDPIA;
  i:integer;
  LstPatro:TStringList;
  SPatro,ssql:String;
  wDia,wMes,wAno : Word;


implementation

uses FParamRelPartDeb,UMensErro, dRelatAdmPrev, UAdmPrev;

{$R *.DFM}

procedure TfrmParamRelRecPIDPIA.FormShow(Sender: TObject);
begin
  inherited;
  DecodeDate(Date, wAno, wMes, wDia);
  cbMes.ItemIndex := wMes - 1;
  dbseAno.Value := wAno;

  LstPatro    :=TStringList.Create;

// Preencher chkList da Patrocinadora
   qryPatro.Close;
   qryPatro.Open;
   FParamRelPartDeb.CriaLista(ChkLstPatro,QryPatro,LstPatro,'IDPESSOA','NOME');

   qrySitFunc.Open;     
end;

procedure TfrmParamRelRecPIDPIA.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  For I := 0 To ChkLstPatro.Items.Count - 1 Do
     ChkLstPatro.Checked[I] := False;

  DecodeDate(Date, wAno, wMes, wDia);
  cbMes.ItemIndex := wMes - 1;
  dbseAno.Value := wAno;
end;

procedure TfrmParamRelRecPIDPIA.bbtnConfirmarClick(Sender: TObject);
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
    ssql:= 'SELECT SF.DESCRICAO AS SITUACAO, '+
           'PJ.NOME AS PATROCINADORA,'+
           'EP.MATRICULA, '+
           'EP.IDPESSOA, '+
           'PF.NOME AS PARTICIPANTE, '+
           'C.NOME AS CONTRIBUICAO, '+
           'HCP.MESREFERENCIA,'+
           'SUBSTR(HCP.MESREFERENCIA,6,2)||SUBSTR(HCP.MESREFERENCIA,5,1)||SUBSTR(HCP.MESREFERENCIA,1,4) AS MES, '+
           'HCP.VALORESPERADO, '+
           'PP.SALMANTIDO '+ 
           'FROM '+
           'HSTCONTRIBPREV HCP, '+
           'ELEGPATRO EP, '+
           'PESSOA PJ, '+
           'PESSOA PF, '+
           'CONTRIBUICAO C, '+
           'SITFUNC SF, '+
           'PARTPREVPLAN PP '+ 
           'WHERE (HCP.MESCOBRANCA = '''+wmes+''') ';
           if (sPatro <> '') then
               ssql := ssql + 'AND (HCP.IDPESSJUR IN ('+sPatro+')) ';
           ssql := ssql + 'AND  (HCP.IDPESSJUR = EP.IDPESSJUR) ';

           If dbcmbSitFunc.Value <> '' Then
              ssql := ssql + 'AND  (EP.IDSITFUNC = ' + qrySitFunc.FieldbyName('IDSITFUNC').AsString +' ) ';

           ssql := ssql + 'AND  (HCP.IDPESSOA = EP.IDPESSOA) '+
                          'AND  (EP.IDSITFUNC = SF.IDSITFUNC) '+
                          'AND  (SF.TIPOSIT = ''P'') '+
                          'AND  (EP.IDPESSJUR = PJ.IDPESSOA) '+
                          'AND  (EP.IDPESSOA = PF.IDPESSOA) '+
                          'AND  (HCP.IDCONTRIBUICAO = C.IDCONTRIBUICAO) '+
                          'AND  (EP.IDPESSOA = PP.IDPESSOA) '+    
                          'AND  (EP.IDPESSJUR = PP.IDPESSJUR) '+  
                          'AND  (PP.FLGDESATIVADO = 0) '+         
                          'ORDER BY PJ.NOME, SF.DESCRICAO, EP.MATRICULA, HCP.MESREFERENCIA ';

    dtmRelatAdmPrev.lbmes.Caption  := cbmes.Text+'/'+dbseano.Text;
    Fazquery(dtmRelatAdmPrev.qryRecPIDPIA,ssql);

    dtmRelatAdmPrev.qryFundacao.Close;
    dtmRelatAdmPrev.qryFundacao.ParamByName('pFundacao').asinteger;
    dtmRelatAdmPrev.qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
    dtmRelatAdmPrev.qryFundacao.Prepare;
    dtmRelatAdmPrev.qryFundacao.Open;
end;

procedure TfrmParamRelRecPIDPIA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPatro.Close;
  qrySitFunc.Close;
end;

end.

