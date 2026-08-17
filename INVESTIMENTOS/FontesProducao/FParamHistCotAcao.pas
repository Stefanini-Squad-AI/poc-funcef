//******************************************************************************
// Rotina     : AbreMinhaQuery
// SOL        : 92822
// Kintana    : 389089
// Data       : 11/08/2008
// Responsável: Ricardo Cristiano
// Descrição  : Instrução CGPC 025 que altera a precificação dos ativos de mercado a vista.
//******************************************************************************

unit FParamHistCotAcao;

interface 

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Machklb, Db, DBTables, Wwquery, checklst,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamHistCotAcao = class(TfrmOkCancelar)
    qryEmissor: TwwQuery;
    qryEmissorIDEMISSOR: TFloatField;
    qryEmissorSIGLAEMISSOR: TStringField;
    Panel1: TPanel;
    Panel2: TPanel;
    clbEmissor: TCheckListBox;
    dbdInicio: TCMDateTimePicker;
    dbdFim: TCMDateTimePicker;
    dblBolsa: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    qryBolsa: TwwQuery;
    qryBolsaIDBOLSAVALORES: TFloatField;
    qryBolsaSGLBOLSAVALORES: TStringField;
    btnMarcaTodos: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnMarcaTodosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    Procedure AbreMinhaQuery;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamHistCotAcao: TfrmParamHistCotAcao;

implementation

Uses FDmRelatorio, UOperacaoInvest, UBibliotecaInvest;

{$R *.DFM}

procedure TfrmParamHistCotAcao.FormCreate(Sender: TObject);
begin
  inherited;
  qryEmissor.Open;
  qryBolsa.Open;
  qryEmissor.First;
  While Not qryEmissor.EOF Do
    Begin
      clbEmissor.Items.AddObject(qryEmissorSIGLAEMISSOR.AsString, TObject(qryEmissorIDEMISSOR.AsInteger));
      qryEmissor.Next;
    End;
end;

procedure TfrmParamHistCotAcao.bbtnConfirmarClick(Sender: TObject);
begin
  If Trim(dbdInicio.Text) = '' Then
     Begin
       MessageDlg('Data de Início não preenchida.', mtError, [mbOK], 0);
       dbdInicio.SetFocus;
       Exit;
     End
  Else
    If Trim(dbdFim.Text) = '' Then
      Begin
        MessageDlg('Data de Fim não preenchida.', mtError, [mbOK], 0);
        dbdFim.SetFocus;
        Exit;
      End
    Else
      If dblBolsa.LookupValue = '' Then
        Begin
          MessageDlg('Bolsa não selecionada.', mtError, [mbOK], 0);
          dblBolsa.SetFocus;
          Exit;
        End;
        
  AbreMinhaQuery;
  Inherited;
end;

procedure TfrmParamHistCotAcao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryEmissor.Close;
  qryBolsa.Close;
  inherited;
end;

procedure TfrmParamHistCotAcao.btnMarcaTodosClick(Sender: TObject);
Var
  I : Integer;
begin
  For I := 0 To Pred(clbEmissor.Items.Count) Do
    clbEmissor.Checked[I] := (btnMarcaTodos.Caption = 'Marca Todos');
  If btnMarcaTodos.Caption = 'Marca Todos'
     Then
       btnMarcaTodos.Caption := 'Desmarca Todos'
     Else
       btnMarcaTodos.Caption := 'Marca Todos';

end;

Procedure TfrmParamHistCotAcao.AbreMinhaQuery;
Var
  ListaEmissor : TStringList;
  I : Integer;
begin
  Modalresult := mrOk;
  ListaEmissor := TStringList.Create;
  Try
    ListaEmissor.Clear;
    For I := 0 To Pred(clbEmissor.Items.Count) Do
      If clbEmissor.Checked[I] Then
        ListaEmissor.Add(IntToStr(Integer(clbEmissor.Items.Objects[I])));

    DtmRelatorio.qryHistCotAcao.Close;
    DtmRelatorio.qryHistCotAcao.SQL.Clear;
    DtmRelatorio.qryHistCotAcao.SQL.Add('SELECT');
    DtmRelatorio.qryHistCotAcao.SQL.Add('   IV.DESCINVESTIMENTO,');
    DtmRelatorio.qryHistCotAcao.SQL.Add('   EM.SIGLAEMISSOR,');
    DtmRelatorio.qryHistCotAcao.SQL.Add('   BV.SGLBOLSAVALORES,');
    DtmRelatorio.qryHistCotAcao.SQL.Add('   CA.IDBOLSAVALORES,');
    DtmRelatorio.qryHistCotAcao.SQL.Add('   CA.DATACOTAACAO,');
    DtmRelatorio.qryHistCotAcao.SQL.Add('   CA.IDACAO,');
    DtmRelatorio.qryHistCotAcao.SQL.Add('   CA.VLRABERTURA,');
    DtmRelatorio.qryHistCotAcao.SQL.Add('   CA.VLRFECHAMENTO,');
    DtmRelatorio.qryHistCotAcao.SQL.Add('   CA.VLRMAXIMA,');
    DtmRelatorio.qryHistCotAcao.SQL.Add('   CA.VLRMINIMA,');
    DtmRelatorio.qryHistCotAcao.SQL.Add('   CA.VLRMEDIA,');
    DtmRelatorio.qryHistCotAcao.SQL.Add('   CA.VOLNEGOCIADO,');
    DtmRelatorio.qryHistCotAcao.SQL.Add('   CA.QTDELOTE,');
    //Ricardo Cristiano - 11/08/2008 - N. Sol 92822 -  N. Kintana 389089
    DtmRelatorio.qryHistCotAcao.SQL.Add('   case PCRV.TIPOCOTACAO ');
    DtmRelatorio.qryHistCotAcao.SQL.Add('   when ''A'' then ');
    DtmRelatorio.qryHistCotAcao.SQL.Add('   ROUND((CA.VLRABERTURA/CA.QTDELOTE),8) ');
    DtmRelatorio.qryHistCotAcao.SQL.Add('   when ''F'' then ');
    DtmRelatorio.qryHistCotAcao.SQL.Add('   ROUND((CA.VLRFECHAMENTO/CA.QTDELOTE),8) ');
    DtmRelatorio.qryHistCotAcao.SQL.Add('   when ''M'' then ');
    DtmRelatorio.qryHistCotAcao.SQL.Add('   ROUND((CA.VLRMEDIA/CA.QTDELOTE),8) ');
    DtmRelatorio.qryHistCotAcao.SQL.Add('   when ''N'' then ');
    DtmRelatorio.qryHistCotAcao.SQL.Add('   ROUND((CA.VLRMINIMA/CA.QTDELOTE),8) ');
    DtmRelatorio.qryHistCotAcao.SQL.Add('   when ''X'' then ');
    DtmRelatorio.qryHistCotAcao.SQL.Add('   ROUND((CA.VLRMAXIMA/CA.QTDELOTE),8) ');
    DtmRelatorio.qryHistCotAcao.SQL.Add('   else 0 end AS VLRDIVMEDIA ');
    DtmRelatorio.qryHistCotAcao.SQL.Add('FROM EMISSOR EM, COTACAOACAO CA, BOLSAVALORES BV, INVESTIMENTO IV, PARAMCOTACAORV PCRV ');
    DtmRelatorio.qryHistCotAcao.SQL.Add('WHERE CA.IDEMISSOR = EM.IDEMISSOR AND');
    DtmRelatorio.qryHistCotAcao.SQL.Add('      CA.IDBOLSAVALORES = BV.IDBOLSAVALORES AND');
    DtmRelatorio.qryHistCotAcao.SQL.Add('      CA.IDACAO = IV.IDINVESTIMENTO AND');
    DtmRelatorio.qryHistCotAcao.SQL.Add('      IV.IDTIPOINVEST = 2 AND');
    //Ricardo Cristiano - 11/08/2008 - N. Sol 92822 -  N. Kintana 389089
    DtmRelatorio.qryHistCotAcao.SQL.Add('     (CA.DATACOTAACAO BETWEEN :DATAINICIAL AND :DATAFINAL) AND');
    DtmRelatorio.qryHistCotAcao.SQL.Add('     (PCRV.DATAVIGENCIA = (SELECT MAX(P.DATAVIGENCIA) AS DATAVIGENCIA');
    DtmRelatorio.qryHistCotAcao.SQL.Add('                           FROM  PARAMCOTACAORV P');
    DtmRelatorio.qryHistCotAcao.SQL.Add('                           WHERE P.DATAVIGENCIA <= CA.DATACOTAACAO)) AND');
    DtmRelatorio.qryHistCotAcao.SQL.Add('      CA.IDBOLSAVALORES = :P_IDBOLSAVALORES');
    If ListaEmissor.Count > 0 Then
       Begin
         DtmRelatorio.qryHistCotAcao.SQL.Add('AND EM.IDEMISSOR IN (');
         For I := 0 To Pred(ListaEmissor.Count) Do
             If I = Pred(ListaEmissor.Count) Then
                DtmRelatorio.qryHistCotAcao.SQL.Add(Format('%S', [ListaEmissor[I]]))
             else
                DtmRelatorio.qryHistCotAcao.SQL.Add(Format('%S,', [ListaEmissor[I]]));
         DtmRelatorio.qryHistCotAcao.SQL.Add(')');
       End;
    DtmRelatorio.qryHistCotAcao.SQL.Add('ORDER BY IV.DESCINVESTIMENTO,  CA.DATACOTAACAO DESC');
    DtmRelatorio.qryHistCotAcao.ParamByName('DATAINICIAL').AsDateTime     := dbdInicio.Date;
    DtmRelatorio.qryHistCotAcao.ParamByName('DATAFINAL').AsDateTime       := dbdFim.Date;
    DtmRelatorio.qryHistCotAcao.ParamByName('P_IDBOLSAVALORES').AsInteger := StrToInt(dblBolsa.LookupValue);
    DtmRelatorio.qryHistCotAcao.Open;
    DtmRelatorio.RptHistCotAcaoLabel12.Caption := dbdInicio.Text;
    DtmRelatorio.RptHistCotAcaoLabel13.Caption := dbdFim.Text;
    DtmRelatorio.RptHistCotAcaoLabel14.Caption := 'Bolsa:  ' + dblBolsa.Value;
  Finally
    ListaEmissor.Free;
  End;
End;

procedure TfrmParamHistCotAcao.FormShow(Sender: TObject);
begin
  inherited;
   dbdInicio.Date := pRPI.DATAULTFECH;
   dbdFim.Date    := pRPI.DATAULTFECH;   
end;

end.
