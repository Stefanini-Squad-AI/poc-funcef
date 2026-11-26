// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 07.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit fParamRelGerencial04;

interface

uses
  Windows    , Messages, SysUtils, Classes , Graphics, Controls, Forms  ,
  FOkCancelar, IvDictio, IvMulti , IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr   , TB97    , ExtCtrls, Dialogs, Spin     , wwdblook, Db     ,
  Wwdatsrc   , DBTables, Wwquery;

type
  TfrmParamRelGerencial04 = class(TfrmOkCancelar)
    GroupBox1        : TGroupBox;
    cmbPatrocinadora : TwwDBLookupCombo;
    GroupBox4        : TGroupBox;
    cmbPlano         : TwwDBLookupCombo;
    GroupBox3        : TGroupBox;
    cmbMes01         : TComboBox;
    spnAno01         : TSpinEdit;
    GroupBox5        : TGroupBox;
    Memo1            : TMemo;
    qryPatrocinadora : TwwQuery;
    qryPlano         : TwwQuery;
    GroupBox2        : TGroupBox;
    cmbxMoeda        : TwwDBLookupCombo;
    qryMoeda         : TwwQuery;
    qryTmp           : TwwQuery;
    qryDetalhe       : TwwQuery;
    dsTmp            : TwwDataSource;
    chkbcTempo       : TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var frmParamRelGerencial04: TfrmParamRelGerencial04;

implementation

uses dRelatGerencial, UAdmPrev, fAguarde;

{$R *.DFM}

procedure TfrmParamRelGerencial04.FormCreate(Sender: TObject);
begin
  inherited;
  // Abre Querys
  QryPatrocinadora.Close;
  QryPatrocinadora.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  QryPatrocinadora.Open;

  qryPlano.Close;
  qryPlano.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;         
  qryPlano.Open;
  QryMoeda.Open;
end;

procedure TfrmParamRelGerencial04.FormClose(Sender: TObject;var Action: TCloseAction);
begin
  inherited;
  // Fecha Querys
  QryPatrocinadora.Close;
  QryPlano.Close;
  QryMoeda.Close;
  // Libera Form
  Action := caFree;
end;

procedure TfrmParamRelGerencial04.bbtnConfirmarClick(Sender: TObject);
Var bFaz                   : Boolean;
    sMes1, sMes2, sCotacao : String;
begin
  inherited;
  // Inicializa Variáveis
  bFaz     := True;
  sMes1    := '';
  sMes2    := '';
  sCotacao := '';
  // Verifica se opções foram escolhidas
  If (cmbPatrocinadora.Value = '') Then
   Begin
     bFaz := False;
     ShowMessage('É obrigatória a escolha de uma Patrocinadora.');
     cmbPatrocinadora.SetFocus;
   End;
  If (cmbPlano.Value = '') Then
   Begin
     bFaz := False;
     ShowMessage('É obrigatória a escolha de um Plano.');
     cmbPlano.SetFocus;
   End;
  If (cmbxMoeda.Value = '') Then
   Begin
     bFaz := False;
     ShowMessage('É obrigatória a escolha de uma Moeda.');
     cmbxMoeda.SetFocus;
   End;

   If bFaz Then
    Begin
      //
      frmAguarde.Mostra('Aguarde... Montando Relatório.');
      // Verifica Tempo de Processamento
      If chkbcTempo.Checked Then
       Begin
         dRelatGerencial.bTempo := True;
         dRelatGerencial.dTempo := Time;
       End
      Else dRelatGerencial.bTempo := False;
      // Ano e Mês Atual
      If (cmbMes01.ItemIndex < 9) Then sMes1 := QuotedStr(spnAno01.Text+'/0'+IntToStr(cmbMes01.ItemIndex+1))
      Else sMes1 := QuotedStr(spnAno01.Text+'/'+IntToStr(cmbMes01.ItemIndex+1));
      // Ano e Mês Anterior
      If (cmbMes01.ItemIndex > 0) Then sMes2 := QuotedStr(spnAno01.Text+'/0'+IntToStr(cmbMes01.ItemIndex))
      Else sMes2 := QuotedStr(IntToStr(StrToInt(spnAno01.Text)-1)+'/12');

      // Monta Relatório 09
      dtmRelatorioGerencial.qryGerencial04.Close;
      dtmRelatorioGerencial.qryGerencial04.Open;
      // Monta Query Principal
      qryTmp.SQL.Clear;
      qryTmp.SQL.Add(' SELECT QRY.IDESTAB   , '+
                     '        QRY.REGIONAL  , '+
                     '        QRY.MEDIAPART , '+
                     '        QRY.MEDIAPATRO, '+
                     '       '+cmbxMoeda.LookupValue+' AS MOECODIGO, '+
                     '       '+cmbPlano.LookupValue+ ' AS IDPLANOPREV, '+
                     '       '+cmbPatrocinadora.LookupValue+' AS IDPESSJUR, '+
                              ''+sMes1+' AS MESREFERENCIA                      '+
                     ' FROM (SELECT REG.NOME                                            AS REGIONAL    , '+
                     '              REG.IDPESSOA                                        AS IDESTAB     , '+
                     '              0                                                   AS MEDIAPART   , '+
                     '              SUM(HCP.VALORRECEBIDO)/COUNT(DISTINCT HCP.IDPESSOA) AS MEDIAPATRO '+
                     '      FROM HSTCONTRIBPREV   HCP, PESSOA    REG, '+
                     '           CONTPREV CP, ELEGPATRO ELP '+
                     '      WHERE HCP.IDPESSJUR     = '+cmbPatrocinadora.LookupValue+
                     '      AND   HCP.IDPLANOPREV   = '+cmbPlano.LookupValue+
                     '      AND   HCP.MESREFERENCIA = '+sMes1+
                     '      AND   HCP.IDMOTIVO      = '+IntToStr(prmIdMotivoContrib)+
                     '      AND   HCP.SEQPROPOSTA   = 1 '+
                     '      AND   HCP.IDPESSJUR     = ELP.IDPESSJUR '+
                     '      AND   HCP.IDPESSOA      = ELP.IDPESSOA '+
                     '      AND   ELP.IDESTAB       = REG.IDPESSOA '+
                     '      AND   HCP.IDPLANOPREV   = CP.IDPLANOPREV '+
                     '      AND   HCP.IDCONTRIBUICAO = CP.IDCONTRIBUICAO '+
                     '      AND   CP.FLGPAGADOR     IN (''P'', ''E'' ) '+
                     '      GROUP BY REG.NOME, REG.IDPESSOA '+
                     '      UNION '+
                     '      SELECT REG.NOME                                                              AS REGIONAL , '+
                     '             REG.IDPESSOA                                                          AS IDESTAB  , '+
                     '             ROUND((SUM(HCP.VALORRECEBIDO)/NVL(COUNT(DISTINCT HCP.IDPESSOA),1)),2) AS MEDIAPART, '+
                     '             0                                                                     AS MEDIAPATRO '+
                     '      FROM HSTCONTRIBPREV   HCP, PESSOA    REG, '+
                     '           CONTPREV CP, ELEGPATRO ELP '+
                     '      WHERE HCP.IDPESSJUR      = '+cmbPatrocinadora.LookupValue+
                     '      AND   HCP.IDPLANOPREV    = '+cmbPlano.LookupValue+
                     '      AND   HCP.MESREFERENCIA  = '+sMes1+
                     '      AND   HCP.SEQPROPOSTA    = 1 '+
                     '      AND   HCP.IDPESSJUR      = ELP.IDPESSJUR '+
                     '      AND   HCP.IDPESSOA       = ELP.IDPESSOA '+
                     '      AND   ELP.IDESTAB        = REG.IDPESSOA '+
                     '      AND   HCP.IDPLANOPREV    = CP.IDPLANOPREV '+
                     '      AND   HCP.IDCONTRIBUICAO = CP.IDCONTRIBUICAO '+
                     '      AND   CP.FLGPAGADOR      =  ''C''  '+
                     '      GROUP BY REG.NOME, REG.IDPESSOA ) QRY '+
                     'ORDER BY QRY.REGIONAL');
      // Abre Querys
      qryTmp.Open;
      qryDetalhe.Open;
      // Prepara Query virtual
      dtmRelatorioGerencial.qryGerencial04.Edit;
      // Loop de preenchimento da query virtual
      While Not qryTmp.Eof Do
       Begin
         dtmRelatorioGerencial.qryGerencial04.FieldByname('REGIONAL').AsString    := qryTmp.FieldByname('REGIONAL').AsString;
         dtmRelatorioGerencial.qryGerencial04.FieldByname('MEDIAPART').AsFloat    := qryTmp.FieldByname('MEDIAPART').AsFloat;
         dtmRelatorioGerencial.qryGerencial04.FieldByname('MEDIAPATRO').AsFloat   := qryTmp.FieldByname('MEDIAPATRO').AsFloat;
         dtmRelatorioGerencial.qryGerencial04.FieldByname('QUEBRA').AsString      := 'A';
         dtmRelatorioGerencial.qryGerencial04.Post;
         dtmRelatorioGerencial.qryGerencial04.Insert;
         If (sCotacao = '') And (Not qryDetalhe.IsEmpty) Then
          Begin
            sCotacao := qryDetalhe.FieldByname('COTACAO').AsString + ' - EM : '+qryDetalhe.FieldByname('DATA').AsString;
          End;
       //   Próximo Registro
         qryTmp.Next;
       End;
      // Fecha Querys Auxiliares
      qryTmp.Close;
//----------------------------------------------------------------------------------------------------

      // Lança Labels no Relatório
     dtmRelatorioGerencial.lbPatro04.Caption := cmbPatrocinadora.Value;
     dtmRelatorioGerencial.lbPlano04.Caption := cmbPlano.Value;
     dtmRelatorioGerencial.lbPatro05.Caption := cmbPatrocinadora.Value;
     dtmRelatorioGerencial.lbPlano05.Caption := cmbPlano.Value;
     dtmRelatorioGerencial.lb10.Caption      := '10 - Movimentação do Cadastro - ( '+sMes1+' - '+sMes2+' )';
     dtmRelatorioGerencial.lbMoeda01.Caption := cmbxMoeda.Value;
     dtmRelatorioGerencial.lbMesRef.Caption  := sMes1;
     dtmRelatorioGerencial.lbCotacao.Caption := sCotacao;
     // Abre Query Fundação
     DtmRelatorioGerencial.qryFundacao.Close;
     DtmRelatorioGerencial.qryFundacao.ParamByName('pFundacao').AsInteger := UAdmPrev.iIdFundacao;
     DtmRelatorioGerencial.qryFundacao.Open;
    End
   Else ModalResult := mrNone;
   frmAguarde.Apaga; 
end;

end.
