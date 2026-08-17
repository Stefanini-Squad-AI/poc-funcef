// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 08.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FParamRelResRubRec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, checklst, Spin, UDataBase;

type
  TfrmParamRelResRubRec = class(TfrmOkCancelar)
    grpMesRef: TGroupBox;
    cbMes: TComboBox;
    dbseAno: TSpinEdit;
    qryPatro: TwwQuery;
    GroupBox1: TGroupBox;
    chklstPatro: TCheckListBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure Fzqry;


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRelResRubRec: TfrmParamRelResRubRec;
  LstPatro,LstPlano:TStringList;
  sPatro, ssql, wAnoMes:String;
  wDia,wMes,wAno : Word;

implementation

uses dRelatorios,UMensErro, UFuncoesUteis, UAdmPrev;

{$R *.DFM}


procedure TfrmParamRelResRubRec.FormShow(Sender: TObject);
begin
  inherited;
  DecodeDate(Date, wAno, wMes, wDia);
  cbMes.ItemIndex := wMes - 1;
  dbseAno.Value := wAno;

  LstPatro :=TStringList.Create;

  qryPatro.Close;
  qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryPatro.Open;

// Preencher chkList da Patrocinadora
   CriaLista(ChkLstPatro,QryPatro,LstPatro,'IDPESSOA','NOME');
end;

procedure TfrmParamRelResRubRec.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPatro.Close;
end;

procedure TfrmParamRelResRubRec.bbtnCancelarClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  For I := 0 To ChkLstPatro.Items.Count - 1 Do
  ChkLstPatro.Checked[I] := False;

  DecodeDate(Date, wAno, wMes, wDia);
  cbMes.ItemIndex := wMes - 1;
  dbseAno.Value := wAno;
end;

procedure TfrmParamRelResRubRec.bbtnConfirmarClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  sPatro:='';

  For I := 0 To ChkLstPatro.Items.Count - 1 Do
    begin
      If ChkLstPatro.Checked[I] = True Then
         sPatro := sPatro + LstPatro.Strings[I]+',';
    end;

  sPatro := Trim(Copy(sPatro,1,((Length(sPatro)-1))));

  if (cbMes.ItemIndex+1) <= 9 Then
     wAnoMes := Trim(dbseano.Text)+'/0'+IntToStr(cbMes.ItemIndex+1)
  else
     wAnoMes := Trim(dbseano.Text)+'/'+IntToStr(cbMes.ItemIndex+1);

// Criticar Dados
  if cbMes.ItemIndex = -1 then
    begin
     MsgDlg('Mês de Cobrança não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     cbMes.SetFocus;
     Exit;
    end
  else if  dbseAno.Value = 0 then
    begin
     MsgDlg('Ano de Cobrança não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     dbseAno.Value := wAno;
     dbseano.SetFocus;
     Exit;
    end
  else
    begin
      Fzqry;
      dtmRelatorios.lblMes.Caption  := cbmes.Text+'/'+dbseano.Text;
      Fazquery(dtmRelatorios.qryResRubRec,ssql);
    end;
end;

Procedure TfrmParamRelResRubRec.Fzqry;
begin
   sSQL:= 'SELECT PJ.NOME, '+
          '       DECODE(NVL(P.FLGTPRUBRICA,''G''),''G'',''GERAL'','+
          '                                        ''P'',''PREVIDENCIÁRIO'', '+
          '                                        ''E'',''EMPRÉSTIMO'', '+
          '                                        ''A'',''ASSISTENCIAL'') FLGTPRUBRICA, '+
          '       DECODE(NVL(P.FLGATRASODEVOL,''N''),''N'',''NORMAL'', '+
          '                                          ''A'', ''ATRASO'', '+
          '                                          ''D'', ''DEVOLUÇÃO'') FLGATRASODEVOL, '+
          '       DECODE(P.FLGDESCONTO,''0'',''PROVENTO'', ''1'', ''DESCONTO'') FLGDESCONTO, '+
          '       H.IDRUBRICA, '+
          '       R.DESCRPROVDESC, '+
          '       COUNT(*) QTDE, '+
          '       SUM(H.VALORPROVENTO) TOTAL '+
          'FROM   HISTRUBSAL H, PROVDESC P, RUBRICAXPESS R, PESSOA PJ '+
          'WHERE  (MESCOBRANCA ='''+WANOMES+''') ';

          // FILTRA PATROCINADORA
          if  (sPATRO <> '')
          then sSQL := sSQL + ' AND (H.IDPESSJUR IN ('+sPATRO+')) ';

          sSQL:= sSQL + ' AND    (H.IDRUBRICA = R.IDRUBRICA) '+
                        ' AND    (H.IDPESSJUR = R.IDPESSOA) '+
                        ' AND    (R.IDRUBRICA = P.IDPROVENTO) '+
                        ' AND    (H.IDPESSJUR = PJ.IDPESSOA) '+
          ' GROUP BY PJ.NOME, P.FLGTPRUBRICA, P.FLGATRASODEVOL, P.FLGDESCONTO, H.IDRUBRICA, R.DESCRPROVDESC '+
          ' UNION '+
          ' SELECT PJ.NOME, '+
          '        DECODE(NVL(P.FLGTPRUBRICA,''G''),''G'',''GERAL'', '+
          '                                         ''P'',''PREVIDENCIÁRIO'', '+
          '                                         ''E'',''EMPRÉSTIMO'', '+
          '                                         ''A'',''ASSISTENCIAL'') FLGTPRUBRICA, '+
          '        DECODE(NVL(P.FLGATRASODEVOL,''N''),''N'',''NORMAL'', '+
          '                                           ''A'', ''ATRASO'', '+
          '                                           ''D'', ''DEVOLUÇÃO'') FLGATRASODEVOL, '+
          '        DECODE(P.FLGDESCONTO,''0'',''PROVENTO'', ''1'', ''DESCONTO'') FLGDESCONTO, '+
          '        R.IDRUBRICA, '+
          '        R.DESCRPROVDESC, '+
          '        COUNT(*) QTDE, '+
          '        SUM(T.VALORRECEBIDO) TOTAL '+
          ' FROM TMPDESC T, PROVDESC P, RUBRICAXPESS R, PESSOA PJ '+
          ' WHERE  (MESCOBRANCA ='''+WANOMES+''') ';

          // FILTRA PATROCINADORA
          if  (sPATRO <> '')
          then sSQL := sSQL + ' AND (T.IDPESSJUR IN ('+sPATRO+')) ';

          sSQL := sSQL+' AND    (T.IDPROVENTO = R.IDRUBRICA) '+
                       ' AND    (T.IDPESSJUR = R.IDPESSOA) '+
                       ' AND    (R.IDRUBRICA = P.IDPROVENTO) '+
                       ' AND    (T.IDPESSJUR = PJ.IDPESSOA) '+
          ' GROUP BY PJ.NOME, P.FLGTPRUBRICA, P.FLGATRASODEVOL, P.FLGDESCONTO, R.IDRUBRICA, R.DESCRPROVDESC '+
          ' ORDER BY NOME, FLGTPRUBRICA, FLGATRASODEVOL, FLGDESCONTO, IDRUBRICA ';

end;

end.
