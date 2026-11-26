unit FPrelBenConced;

interface

uses
  Windows    , Messages, SysUtils, Classes, Graphics, Controls, Forms   ,
  FOkCancelar, Db      , DBTables, Wwquery, StdCtrls, wwdblook, IvDictio,
  IvMulti    , IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97    , ExtCtrls,
  Dialogs   , checklst, Spin, UfuncoesFolha,UFuncoesUteisFB, usistema, dbasedados;

type
  TfrmPRelBenConced = class(TfrmOkCancelar)
    grpbxHistorico: TGroupBox;
    dblkfolha             : TwwDBLookupCombo;
    qryHist               : TwwQuery;
    qryHistIDHSTFOLHABENEF: TFloatField;
    qryHistHISTORICO      : TStringField;
    qryMesRef             : TwwQuery;
    qryMesAnt             : TwwQuery;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    lstbxPatro: TCheckListBox;
    lstbxBenef: TCheckListBox;
    Label1: TLabel;
    Label2: TLabel;
    qryBeneficio: TwwQuery;
    qryPatro: TwwQuery;
    bbtnPatroTodas: TBitBtn;
    bbtnPatroInverte: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    grpbxMes: TGroupBox;
    cmbMes: TComboBox;
    spedAno: TSpinEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnPatroTodasClick(Sender: TObject);
    procedure bbtnPatroInverteClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPRelBenConced: TfrmPRelBenConced;

implementation

uses dRelFolha, uAdmPrevFB;

{$R *.DFM}

procedure TfrmPRelBenConced.bbtnConfirmarClick(Sender: TObject);
var
  sMesAnt, sMesAtu, sBenef, sPatro, sMes : string;
  sIdHstFolha, n                         : Integer;
  bFaz,bDefinitivo                       : Boolean;
begin
  inherited;
  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  // Inicializa Variáveis
  sBenef      := '';
  sPatro      := '';
  sMes        := '';
  bFaz        := True;
  bDefinitivo := CheckBox1.Checked;

  // Verifica se algum Benefício foi escolhido
  For n := 0 To (lstbxBenef.Items.Count-1) Do Begin
      If lstbxBenef.Checked[n] Then
         If sBenef <> '' Then
            sBenef := sBenef + ', ' + PSTR(lstbxBenef.Items[n])
         Else
            sBenef := sBenef + PSTR(lstbxBenef.Items[n]);
  End;


  // Verifica se alguma Patrocinadora foi escolhida
  For n := 0 To (lstbxPatro.Items.Count-1) Do Begin
         If lstbxPatro.Checked[n] Then
            If sPatro <> '' Then
               sPatro := sPatro + ', ' + lstbxPatro.Items[n]
            Else
               sPatro := sPatro + lstbxPatro.Items[n];
  End;

  // Testa se o Relatório é Definitivo ou Não
  // ----------------------------------------

  // Se for = HISTÓRICO
  If bDefinitivo Then begin
     If dblkfolha.Text = '' Then begin
        bFaz := False;
        ShowMessage('Se o Relatório é DEFINITIVO algum Histórico deve ser escolhido !');
     End;
  end Else Begin
     If (cmbMes.Text = '') Or (spedAno.Value < 1930) Then Begin
        bFaz := False;
        ShowMessage('Se o Relatório não é DEFINITIVO o Mês deve ser escolhido e o Ano maior que 1930 !');
     End Else
        If cmbMes.ItemIndex < 9 Then
           sMes := IntToStr(spedAno.Value)+'/0'+IntToStr((cmbMes.ItemIndex+1))
        Else
            sMes := IntToStr(spedAno.Value)+'/'+IntToStr(cmbMes.ItemIndex+1);
  end;

   // Monta Query
  If bFaz Then Begin

      // Monta Querys
      With dtmRelFolha Do Begin
         // Query Principal
         qryBenConced.Close;
         qryBenConced.SQL.Clear;
         If Not bDefinitivo then begin
            qryBenConced.SQL.Add(
            'SELECT DISTINCT H1.IDPESSOA, '+
            '                H1.VALORPROVENTO   AS VALOR        , '+
            '                P.NOME             AS BENEFICIARIO , '+
            '                PJ.NOME            AS PATROCINADORA, '+
            '                PP.INSCRICAONUMERO AS INSCRICAO    , '+
            '                B.NOME             AS BENEFICIO    , '+
            '                ELG.MATRICULA                      , '+
            '                BFB.DATAINICIO                     , '+
            '                PLANPREV.NOME      AS PLANO          '+
            'FROM            PESSOA           PJ                , '+
            '                PESSOA           P                 , '+
            '                HSTBENEFBFCIARIO HBF               , '+
            '                BENEFBFCIARIO    BFB               , '+
            '                ELEGPATRO        ELG               , '+
            '                PREVIA           H1                , '+
            '                PARTPREVPLAN     PP                , '+
            '                BENEFICIO        B                 , '+
            '                BENEFPLANPREV    BPP               , '+
            '                PLANPREV                           , '+
            '                PATRO                              , '+
            '                HSTFOLHABENEF    HSB                 '+
            'WHERE                                                '+
             //  Join da PREVIA com a selecao do usuario
            '     (H1.MESCOBRANCA = '+pStr(sMes)+')                AND '+
             // Join da PREVIA com a PESSOA
            '      (H1.IDPATRO           = PJ.IDPESSOA)        AND '+
             // Join da PREVIA com a PESSOA
            '     (H1.IDPESSOA    = P.IDPESSOA)                AND '+
            // Join da PREVIA com a PLANPREV
            '      (H1.IDPLANOPREV = PLANPREV.IDPLANOPREV)     AND '+
            // Join da PREVIA com a ELEGPATRO
            '      (H1.IDPATRO        = ELG.IDPESSJUR)         AND '+
             // Join da PREVIA com a BENEFPLANPREV
            '      (H1.IDBENEFICIO      = BPP.IDBENEFICIO)     AND '+
             // Join da BENEFPLANPREV com a BENEFICIO
            '      (BPP.IDBENEFICIO        = B.IDBENEFICIO)    AND '+
             // Join da BENEFICIO com a BENEFBFCIARIO
            '      (B.IDBENEFICIO        = BFB.IDBENEFICIO)    AND '+
             // Join da BENEFBFCIARIO com a HSTBENEFBFCIARIO
            '      (BFB.IDPESSOA         = HBF.IDPESSOA)       AND '+
             // Join da BENEFBFCIARIO com a HSTBENEFBFCIARIO
            '      (BFB.IDBENEFICIO      = HBF.IDBENEFICIO)    AND '+
              // Join da ELEGPATRO  com a PARTPREVPLAN
            '      (ELG.IDPESSOA         = PP.IDPESSOA)        AND '+
            // Join da PARTPREVPLAN com a PESSOA
            '      (PP.IDPESSOA           = P.IDPESSOA)        AND '+
             // Join da PARTPREVPLAN com a BENEFBFCIARIO
            '      (PP.IDPESSOA          = BFB.IDPESSOA)           ');

         end else begin  // Se for Definitiva

            qryBenConced.SQL.Add(
            'SELECT DISTINCT H1.IDPESSOA, '+
            '                H1.VALORPROVENTO   AS VALOR        , '+
            '                P.NOME             AS BENEFICIARIO , '+
            '                PJ.NOME            AS PATROCINADORA, '+
            '                PP.INSCRICAONUMERO AS INSCRICAO    , '+
            '                B.NOME             AS BENEFICIO    , '+
            '                ELG.MATRICULA                      , '+
            '                BFB.DATAINICIO                     , '+
            '                PLANPREV.NOME      AS PLANO          '+
            'FROM            HISTRUBSAL       H1                , '+
            '                HSTBENEFBFCIARIO HBF               , '+
            '                PESSOA           PJ                , '+
            '                PESSOA           P                 , '+
            '                BENEFBFCIARIO    BFB               , '+
            '                ELEGPATRO        ELG               , '+
            '                PARTPREVPLAN     PP                , '+
            '                BENEFICIO        B                 , '+
            '                BENEFPLANPREV    BPP               , '+
            '                PLANPREV                           , '+
            '                PATRO                              , '+
            '                HSTFOLHABENEF    HSB                 '+
            'WHERE                                                '+
             // Join da HSTFOLHABENEF com a selecao do usuario
            '(HSB.IDHSTFOLHABENEF  = '+qryHist.FieldByName('IDHSTFOLHABENEF').AsString+') AND '+
             // Join da HISTRUBSAL com a HSTFOLHABENEF
            '(H1.IDHSTFOLHABENEF  = HSB.IDHSTFOLHABENEF) AND '+
             // Join da HISTRUBSAL com a PESSOA
             '(H1.IDPESSOA         = P.IDPESSOA)         AND '+
             // Join da HISTRUBSAL com a PESSOA
            ' (H1.IDPATRO           = PJ.IDPESSOA)        AND '+
               // Join da HISTRUBSAL com a PLANPREV
            '      (H1.IDPLANOPREV = PLANPREV.IDPLANOPREV)     AND '+
             // Join da HISTRUBSAL com a ELEGPATRO
            '      (H1.IDPATRO        = ELG.IDPESSJUR)         AND '+
             // Join da HISTRUBSAL com a HSTBENEFBFCIARIO
            ' (H1.IDPESSOA = HBF.IDPESSOA)                     AND '+
              // Join da HSTBENEFBFCIARIO com a BENEFBFCIARIO
            '      (HBF.IDPESSOA         = BFB.IDPESSOA)       AND '+
              // Join da BENEFBFCIARIO com a PARTPREVPLAN
            '  (BFB.IDPESSOA     =      PP.IDPESSOA )          AND '+
              // Join da PARTPREVPLAN com a ELEGPATRO
            ' (PP.IDPESSOA       =     ELG.IDPESSOA)           AND' +
              // Join da PARTPREVPLAN com a PESSOA
            '      (PP.IDPESSOA           = P.IDPESSOA)        AND '+
            // Join da BENEFBFCIARIO com a BENEFICIO
            '      (BFB.IDBENEFICIO        = B.IDBENEFICIO)    AND '+
            // Join da BENEFICIO com a BENEFPLANPREV
            '      (B.IDBENEFICIO      = BPP.IDBENEFICIO)        ');

         end;
   
         // Se algum Beneficio foi escolhido
         If sBenef <> '' Then
            qryBenConced.SQL.Add(' AND (B.NOME IN('+sBenef+'))  ');
         // Se alguma Patrocinadora foi escolhida
         If sPatro <> '' Then
            qryBenConced.SQL.Add(' AND (PJ.NOME IN('+pStr(sPatro)+')) ');

          qryBenConced.SQL.Add(' ORDER BY B.NOME,PP.INSCRICAONUMERO');

         // -----   FIM DA QUERY PRINCIPAL --------//


         // Coloca Dados no Relatório
         rpBenConcedLabel8.Caption := 'Mes/Ano : ' + Copy(sMes,6,2) + '/' + Copy(sMes,1,4);
         // Abre Query do Cabeçalho
         qryFundacao.Close;
         qryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
         qryFundacao.Open;
      end
  end Else
    ModalResult := mrNone;
end;

procedure TfrmPRelBenConced.FormActivate(Sender: TObject);
begin
  inherited;
  qryhist.close;
  qryhist.open;
end;

procedure TfrmPRelBenConced.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryhist.close;
  qryMesRef.close;
  qryMesAnt.close;
end;

procedure TfrmPRelBenConced.CheckBox1Click(Sender: TObject);
begin
  inherited;
  // Inibe / Desinibe Histórico ou Mês Referência
  grpbxMes.Visible       := Not grpbxMes.Visible;
  grpbxHistorico.Visible := Not grpbxHistorico.Visible;
end;

procedure TfrmPRelBenConced.FormCreate(Sender: TObject);
begin
  inherited;
  // Abre Querys
  qryPatro.Open;
  qryBeneficio.Open;
  // Limpa CheckListBox
  lstbxPatro.Items.Clear;
  lstbxBenef.Items.Clear;
  // Preenche o CheckListBox da PATROCINADORA
  While Not qryPatro.EOF Do
   Begin
     lstbxPatro.Items.Add(qryPatro.FieldByName('NOME').AsString);
     qryPatro.Next;
   End;
  // Preenche o CheckListBox do BENEFICIO
  While Not qryBeneficio.EOF Do
   Begin
     lstbxBenef.Items.Add(qryBeneficio.FieldByName('BENEFICIO').AsString);
     qryBeneficio.Next;
   End;
  // Ano e Mês
  cmbMes.ItemIndex  := StrToInt(Copy(DateToStr(Date),4,2))-1;
  spedAno.Text      := Copy(DateToStr(Date),7,4);
end;

procedure TfrmPRelBenConced.bbtnPatroTodasClick(Sender: TObject);
Var iTot, n : Integer;
begin
  inherited;
  // Seleciona TODOS
  iTot  := lstbxBenef.Items.Count;
  For n := 0 To (iTot-1) Do lstbxBenef.Checked[n] := True;
end;

procedure TfrmPRelBenConced.bbtnPatroInverteClick(Sender: TObject);
Var iTot, n : Integer;
begin
  inherited;
  // INVERTE Seleção
  iTot  := lstbxBenef.Items.Count;
  For n := 0 To (iTot-1) Do lstbxBenef.Checked[n] := Not lstbxBenef.Checked[n];
end;

procedure TfrmPRelBenConced.BitBtn1Click(Sender: TObject);
Var iTot, n : Integer;
begin
  inherited;
  // Seleciona TODOS
  iTot  := lstbxPatro.Items.Count;
  For n := 0 To (iTot-1) Do lstbxPatro.Checked[n] := True;
end;

procedure TfrmPRelBenConced.BitBtn2Click(Sender: TObject);
Var iTot, n : Integer;
begin
  inherited;
  // INVERTE Seleção
  iTot  := lstbxPatro.Items.Count;
  For n := 0 To (iTot-1) Do lstbxPatro.Checked[n] := Not lstbxPatro.Checked[n];
end;

end.
{==============================================================================|
| UNIT:                                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 28/08/2004 A 28/08/2004                         |
| PENDÊNCIA: 17803                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Não utilizar mais CMINTBANCO em 2 camadas e substituir a unit uBiblioteca    |
| pela uString.                                                                |
|                                                                              |
|------------------------------------------------------------------------------}

