{===============================================================================
Unit    : fImportaVersao
Form    : frmImportaVersao

Autor   : Claudio Faria
Empresa : CM Soluções

Data    : 30/06/2006

Objetivo: Criar uma versão de participantes baseado em uma versão já criada
          CM 21524

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

==============================================================================  }
unit fImportaVersao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Wwdatsrc, Mask, wwdblook,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, DBClient, uCMClientDataSet,
  Wwdotdot, Wwdbcomb, wwdbedit, wwdbdatetimepicker;

type
  TfrmImportaVersao = class(TfrmSairAjuda)
    qryParticipante: TwwQuery;
    qryDependente: TwwQuery;
    dsParticipante: TwwDataSource;
    qryValorParticipante: TwwQuery;
    qryTempoParticipante: TwwQuery;
    qryBeneficiario: TwwQuery;
    qryVersao: TwwQuery;
    qryBaseVersao: TwwQuery;
    qryAux: TwwQuery;
    qryNovaVersao: TwwQuery;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    EdtVersao: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    edDesNovaVersao: TEdit;
    GroupBox3: TGroupBox;
    BtBtnImporta: TBitBtn;
    qryListaValor: TwwQuery;
    qryListaTempo: TwwQuery;
    pcCriticas: TPageControl;
    tbsDetalhe: TTabSheet;
    tbsDados: TTabSheet;
    dbgCriticas: TwwDBGrid;
    plDados: TPanel;
    pnlBarraDetalhe: TPanel;
    BtExcl: TSpeedButton;
    btAlt: TSpeedButton;
    BtIns: TSpeedButton;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    dsCriticas: TwwDataSource;
    pcTipos: TPageControl;
    tbsTempo: TTabSheet;
    tbsValores: TTabSheet;
    tbsPlano: TTabSheet;
    dbcbTipoTempo: TwwDBLookupCombo;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    dbeAlteradoTempo: TwwDBEdit;
    dbcbCondicaoTempo: TwwDBComboBox;
    Label10: TLabel;
    dbcbTipoValor: TwwDBLookupCombo;
    Label11: TLabel;
    dbcbCondicaoValor: TwwDBComboBox;
    Label12: TLabel;
    dbedAlteradoValor: TwwDBEdit;
    Label13: TLabel;
    dbcbPlano: TwwDBLookupCombo;
    Label14: TLabel;
    qryCargos: TwwQuery;
    qryPlano: TwwQuery;
    dbcbCargoTempo: TwwDBLookupCombo;
    Label15: TLabel;
    dbcbCargoValor: TwwDBLookupCombo;
    Label16: TLabel;
    cdsCriticas: TClientDataSet;
    cdsCriticasTP_CRITICA: TIntegerField;
    cdsCriticasID_ALTERADOR: TIntegerField;
    cdsCriticasDS_ALTERADOR: TStringField;
    cdsCriticasVL_ALTERADOR: TStringField;
    cdsCriticasID_CARGO: TIntegerField;
    cdsCriticasDS_CARGO: TStringField;
    cdsCriticasIR_CONDICAO: TStringField;
    lbInfo: TLabel;
    dbcbPlanoValor: TwwDBLookupCombo;
    Label1: TLabel;
    procedure BtBtnImportaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtInsClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure btAltClick(Sender: TObject);
    procedure BtExclClick(Sender: TObject);
    procedure dbedAlteradoValorKeyPress(Sender: TObject; var Key: Char);
    procedure dbeAlteradoTempoKeyPress(Sender: TObject; var Key: Char);
    procedure dbeAlteradoTempoExit(Sender: TObject);
    procedure edDesNovaVersaoChange(Sender: TObject);
    procedure dbcbCondicaoTempoChange(Sender: TObject);
  private
    { Private declarations }
    function ConverteValor(Tipo, ID_Alterador:Integer;Valor:Variant):Variant;

    procedure GravaVersao;

    procedure ImportaTudo;

    procedure InsereParticipantes;
    Procedure InsereDependente;
    procedure InsereValorParticipante;
    procedure InsereTempoParticipante;
    procedure InsereBeneficiario;
  public
    { Public declarations }
  end;

var
  frmImportaVersao: TfrmImportaVersao;
  NovaVersao:Integer;
  sCD_Versao:String;
  strGuardaSQL:TStringList;

implementation

uses uQueryCondicao, dImportaTotalPrev, dBaseDados, FPrincipal, uGlobal, FTelaAut,
  uVersaoBase, uSistema, fAguarde;

{$R *.DFM}

Function Valida_Data(Data:String):Boolean;
Begin
   Try
     StrToDate(Data);
     Result := True;
   Except
     Result := False;
   End;
End;

function TfrmImportaVersao.ConverteValor(Tipo, ID_Alterador:Integer;Valor:Variant):Variant;
Var Critica:Integer;
    Calculo:Double;
    Data:TDateTime;
Begin
   cdsCriticas.First;

   While not cdsCriticas.Eof do
   Begin
      Critica := cdsCriticas.FieldByName('TP_CRITICA').AsInteger;

      If cdsCriticas.FieldByName('VL_ALTERADOR').AsString = '' Then
      Begin
         cdsCriticas.Next;
         Continue;
      End;

      If (cdsCriticas.FieldByName('DS_CARGO').AsString <> '') And
         (cdsCriticas.FieldByName('ID_CARGO').AsInteger <>
          qryParticipante.FieldByName('CD_TIPO_CAT_PROF_ESP').AsInteger) Then
      Begin
         cdsCriticas.Next;
         Continue;
      End;

      If (Critica = 0) and (Critica = Tipo) Then
      Begin
         If cdsCriticas.FieldByName('ID_ALTERADOR').AsInteger <> ID_Alterador Then
         Begin
            cdsCriticas.Next;
            Continue;
         End;

         If cdsCriticas.FieldByName('IR_CONDICAO').AsString = 'data exata' Then
            Valor := VarToDateTime(cdsCriticas.FieldByName('VL_ALTERADOR').AsString);

         If cdsCriticas.FieldByName('IR_CONDICAO').AsString = 'adiciona dias' Then
            Valor := (VarToDateTime(Valor) + cdsCriticas.FieldByName('VL_ALTERADOR').AsInteger);

         If cdsCriticas.FieldByName('IR_CONDICAO').AsString = 'diminui dias' Then
            Valor := (VarToDateTime(Valor) + cdsCriticas.FieldByName('VL_ALTERADOR').AsInteger);
      End;

      If (Critica = 1) and (Critica = Tipo) Then
      Begin
         If cdsCriticas.FieldByName('VL_ALTERADOR').AsInteger < 1 Then
         Begin
            cdsCriticas.Next;
            Continue;
         End;

         If cdsCriticas.FieldByName('ID_ALTERADOR').AsInteger <> ID_Alterador Then
         Begin
            cdsCriticas.Next;
            Continue;
         End;

         If cdsCriticas.FieldByName('IR_CONDICAO').AsString = '+' Then
            Valor := Valor + (Valor * (StrToInt(cdsCriticas.FieldByName('VL_ALTERADOR').AsString) / 100));

         If cdsCriticas.FieldByName('IR_CONDICAO').AsString = '-' Then
            Valor := Valor - (Valor * (StrToInt(cdsCriticas.FieldByName('VL_ALTERADOR').AsString) / 100));
      End;

      If (Critica = 2) and (Critica = Tipo)  Then
      Begin
         Valor := StrToInt(cdsCriticas.FieldByName('VL_ALTERADOR').AsString);

         Try
            qryBaseVersao.ParamByName('CD_VERSAO').AsInteger        := NovaVersao;
            qryBaseVersao.ParamByName('CD_PESSOA_PATROC').AsInteger := qryAux.FieldByName('CD_PESSOA_PATROC').AsInteger;
            qryBaseVersao.ParamByName('CD_PESSOA_ENTID').AsInteger  := qryAux.FieldByName('CD_PESSOA_ENTID').AsInteger;
            qryBaseVersao.ParamByName('CD_PLANO').AsInteger         := Valor;
            qryBaseVersao.ExecSQL;
         Except End;
      End;

      cdsCriticas.Next;
   End;

   Result := Valor;
End;

procedure TfrmImportaVersao.GravaVersao;
Var vCampos:String;
Begin
   { Retorna Nova Versão}
   If Not qryNovaVersao.Active Then
      qryNovaVersao.Open;
   NovaVersao := qryNovaVersao.FieldByName('NOVAVERSAO').AsInteger;
   qryNovaVersao.Close;

   { Gerando informações do FI_VERSAO_BASE }
   qryVersao.ParamByName('CD_VERSAO').AsInteger        := NovaVersao;
   qryVersao.ParamByName('DS_VERSAO').AsString         := edDesNovaVersao.Text;
   qryVersao.ParamByName('DT_GERACAO').AsDateTime      := Now;
   qryVersao.ParamByName('LOGIN').AsString             := Sistema.NomeUsuario;
   qryVersao.ParamByName('DT_REFER_BASE').AsDateTime   := Date;
   qryVersao.ParamByName('IR_BASE_HISTORICA').AsString := 'N';
   qryVersao.ExecSQL;

   { Gerando informações do FI_BASE_PLANO_PATRONAL }
   vCampos := ' DISTINCT FI_PARTICIPANTE.CD_PESSOA_PATROC,' +
              '          FI_PARTICIPANTE.CD_PESSOA_ENTID, ' +
              '          FI_PARTICIPANTE.CD_PLANO         ';

   qryAux.Close;
   qryAux.SQL.Text := strGuardaSQL.Text;
   qryAux.SQL.Delete(qryAux.SQL.Count-1);
   qryAux.SQL.Text := StringReplace(qryAux.SQL.Text, ' 1 ', vCampos, []);
   qryAux.SQL.Text := StringReplace(qryAux.SQL.Text, ':CD_VERSAO', sCD_Versao, []);
   qryAux.Open;

   While not qryAux.Eof do
   Begin
      qryBaseVersao.ParamByName('CD_VERSAO').AsInteger        := NovaVersao;
      qryBaseVersao.ParamByName('CD_PESSOA_PATROC').AsInteger := qryAux.FieldByName('CD_PESSOA_PATROC').AsInteger;
      qryBaseVersao.ParamByName('CD_PESSOA_ENTID').AsInteger  := qryAux.FieldByName('CD_PESSOA_ENTID').AsInteger;
      qryBaseVersao.ParamByName('CD_PLANO').AsInteger         := qryAux.FieldByName('CD_PLANO').AsInteger;
      qryBaseVersao.ExecSQL;

      qryAux.Next;
   End;
End;

procedure TfrmImportaVersao.InsereParticipantes;
Begin
   With DtmImportaTotalPrev.QryInsParticipante Do
   Begin
      ParamByName('CD_VERSAO').AsInteger                := NovaVersao;
      ParamByName('IDTITULAR').AsInteger                := qryParticipante.FieldByName('CD_PARTIC').AsInteger;
      ParamByName('PATROC').AsInteger                   := qryParticipante.FieldByName('CD_PESSOA_PATROC').AsInteger;
      ParamByName('CD_ENTID').AsInteger                 := qryParticipante.FieldByName('CD_PESSOA_ENTID').AsInteger;


      ParamByName('PLANO').AsInteger                    := ConverteValor(2,
                                                                         0,
                                                                         qryParticipante.FieldByName('CD_PLANO').AsInteger);

      ParamByName('NOME').AsString                      := qryParticipante.FieldByName('NO_PESSOA').AsString;
      ParamByName('MATRICULA').AsString                 := qryParticipante.FieldByName('NR_MATRICULA').AsString;
      ParamByName('CPF').AsString                       := qryParticipante.FieldByName('NR_CPF').AsString;

      If Trim(qryParticipante.FieldByName('CD_ESTADO_CIVIL').AsString) = '' Then
         ParamByName('ESTADO_CIVIL').Clear
      Else
         ParamByName('ESTADO_CIVIL').AsString              := qryParticipante.FieldByName('CD_ESTADO_CIVIL').AsString;

      ParamByName('SEXO').AsString                      := qryParticipante.FieldByName('IR_SEXO').AsString;
      ParamByName('REGIONAL').AsString                  := qryParticipante.FieldByName('DS_REGIONAL').AsString;

      If qryParticipante.FieldByName('CD_SITUACAO_FUNDACAO').AsInteger = 0 Then
         ParamByName('SITUACAO_FUNDACAO').Clear
      Else
         ParamByName('SITUACAO_FUNDACAO').AsInteger        := qryParticipante.FieldByName('CD_SITUACAO_FUNDACAO').AsInteger;

      If qryParticipante.FieldByName('CD_SITUACAO_PATROC').AsInteger = 0 Then
         ParamByName('SITUACAO_PATROCINADORA').Clear
      Else
         ParamByName('SITUACAO_PATROCINADORA').AsInteger   := qryParticipante.FieldByName('CD_SITUACAO_PATROC').AsInteger;

      ParamByName('IR_FUNDACAO_ORIGEM').AsString        := qryParticipante.FieldByName('IR_FUNDACAO_ORIGEM').AsString;
      ParamByName('IR_PERTENCE_PATROCINADORA').AsString := qryParticipante.FieldByName('IR_PERTENCE_PATROCINADORA').AsString;
      ParamByName('IR_DIRETOR').AsString                := qryParticipante.FieldByName('IR_DIRETOR').AsString;

      If qryParticipante.FieldByName('CD_PLANO_ANTERIOR').AsInteger = 0 Then
         ParamByName('CD_PLANO_ANTERIOR').Clear
      Else
         ParamByName('CD_PLANO_ANTERIOR').AsInteger        := qryParticipante.FieldByName('CD_PLANO_ANTERIOR').AsInteger;

      ParamByName('IR_MIGRACAO_PLANO').AsString         := qryParticipante.FieldByName('IR_MIGRACAO_PLANO').AsString;

      If qryParticipante.FieldByName('CD_TIPO_CAT_PROF_ESP').AsInteger = 0 Then
         ParamByName('CD_TIPO_CAT_PROF_ESP').Clear
      Else
         ParamByName('CD_TIPO_CAT_PROF_ESP').AsInteger     := qryParticipante.FieldByName('CD_TIPO_CAT_PROF_ESP').AsInteger;

      ParamByName('TP_PARTICIPANTE').AsString           := qryParticipante.FieldByName('TP_PARTICIPANTE').AsString;

      If Trim(qryParticipante.FieldByName('CD_VINCULA_PARTIC').AsString) = '' Then
         ParamByName('CD_VINCULA_PARTIC').Clear
      Else
         ParamByName('CD_VINCULA_PARTIC').AsString         := qryParticipante.FieldByName('CD_VINCULA_PARTIC').AsString;

      If qryParticipante.FieldByName('CD_OUTRA_FUNDACAO').AsInteger = 0 Then
         ParamByName('CD_OUTRA_FUNDACAO').Clear
      Else
         ParamByName('CD_OUTRA_FUNDACAO').AsInteger        := qryParticipante.FieldByName('CD_OUTRA_FUNDACAO').AsInteger;

      ParamByName('IR_CONDICAO_TRABALHO').AsString      := qryParticipante.FieldByName('IR_CONDICAO_TRABALHO').AsString;
      ExecSQL;
   End;
End;

Procedure TfrmImportaVersao.InsereDependente;
Begin
   With DtmImportaTotalPrev.QryInsDependente Do
   Begin
      ParamByName('CD_VERSAO').AsInteger          := NovaVersao;
      ParamByName('CD_PARTIC').AsInteger          := qryDependente.FieldByName('CD_PARTIC').AsInteger;
      ParamByName('CD_DEPENDENTE').AsInteger      := qryDependente.FieldByName('CD_DEPENDENTE').AsInteger;

      If Trim(qryDependente.FieldByName('CD_GRAU_DEPENDENCIA').AsString) = '' Then
         ParamByName('CD_GRAU_DEPENDENCIA').Clear
      Else
         ParamByName('CD_GRAU_DEPENDENCIA').AsString := qryDependente.FieldByName('CD_GRAU_DEPENDENCIA').AsString;

      If qryDependente.FieldByName('CD_DURACAO').AsInteger = 0 Then
         ParamByName('CD_DURACAO').Clear
      Else
         ParamByName('CD_DURACAO').AsInteger         := qryDependente.FieldByName('CD_DURACAO').AsInteger;

      If qryDependente.FieldByName('CD_SITUACAO_PLANO').AsInteger = 0 Then
         ParamByName('CD_SITUACAO_PLANO').Clear
      Else
         ParamByName('CD_SITUACAO_PLANO').AsInteger  := qryDependente.FieldByName('CD_SITUACAO_PLANO').AsInteger;

      ParamByName('NO_DEPENDENTE').AsString       := qryDependente.FieldByName('NO_DEPENDENTE').AsString;

      If qryDependente.FieldByName('CD_GRAU_INSTRUCAO').AsInteger = 0 Then
         ParamByName('CD_GRAU_INSTRUCAO').Clear
      Else
         ParamByName('CD_GRAU_INSTRUCAO').AsInteger  := qryDependente.FieldByName('CD_GRAU_INSTRUCAO').AsInteger;

      ParamByName('NR_MATRICULA').AsString        := qryDependente.FieldByName('NR_MATRICULA').AsString;
      ParamByName('DT_NASC').AsDateTime           := qryDependente.FieldByName('DT_NASC').AsDateTime;
      ParamByName('IR_SEXO').AsString             := qryDependente.FieldByName('IR_SEXO').AsString;
      ParamByName('NR_ANOS_DEPENDENTE').AsInteger := qryDependente.FieldByName('NR_ANOS_DEPENDENTE').AsInteger;
      ExecSQL;
   End;
End;

procedure TfrmImportaVersao.InsereValorParticipante;
Var vValor:Real;
begin
   With DtmImportaTotalPrev.QryInsValorParticipante do
   Begin
      ParamByName('CD_VERSAO').asInteger     := NovaVersao;;
      ParamByName('CD_PARTIC').AsInteger     := qryValorParticipante.FieldByName('CD_PARTIC').AsInteger;
      ParamByName('CD_TIPO_VALOR').AsInteger := qryValorParticipante.FieldByName('CD_TIPO_VALOR').AsInteger;

      vValor := ConverteValor(1,
                              qryValorParticipante.FieldByName('CD_TIPO_VALOR').AsInteger,
                              qryValorParticipante.FieldByName('VL_PARTICIPANTE').Value);

      ParamByName('VL_PARTICIPANTE').Value   := vValor;
      ExecSQL;
   End;
end;

procedure TfrmImportaVersao.InsereTempoParticipante;
Var dValor:TDateTime;
begin
  with DtmImportaTotalPrev.QryInsTempoParticipante do
  Begin
      ParamByName('CD_VERSAO').AsInteger     := NovaVersao;
      ParamByName('CD_PARTIC').AsInteger     := qryTempoParticipante.FieldByName('CD_PARTIC').AsInteger;
      ParamByName('CD_TIPO_TEMPO').AsInteger := qryTempoParticipante.FieldByName('CD_TIPO_TEMPO').AsInteger;

      dValor := ConverteValor(0,
                              qryTempoParticipante.FieldByName('CD_TIPO_TEMPO').AsInteger,
                              qryTempoParticipante.FieldByName('DT_TEMPO').AsDateTime);

      ParamByName('DT_TEMPO').AsDateTime     := dValor;
      ParamByName('QT_DIA_TEMPO').AsInteger  := qryTempoParticipante.FieldByName('QT_DIA_TEMPO').AsInteger;
      ParamByName('QT_MES_TEMPO').AsInteger  := qryTempoParticipante.FieldByName('QT_MES_TEMPO').AsInteger;
      ParamByName('QT_ANO_TEMPO').AsInteger  := qryTempoParticipante.FieldByName('QT_ANO_TEMPO').AsInteger;
      ExecSQL;
   End;
end;

procedure TfrmImportaVersao.InsereBeneficiario;
begin
   with DtmImportaTotalPrev.QryInsBeneficiario do
   Begin
      ParamByName('CD_VERSAO').AsInteger             := NovaVersao;
      ParamByName('CD_PARTIC').AsInteger             := qryBeneficiario.FieldByName('CD_PARTIC').AsInteger;
      ParamByName('CD_BENEF_TITULAR').AsInteger      := qryBeneficiario.FieldByName('CD_BENEF_TITULAR').AsInteger;
      ParamByName('CD_BENEFICIARIO').AsInteger       := qryBeneficiario.FieldByName('CD_BENEFICIARIO').AsInteger;
      ParamByName('CD_PESSOA_ENTID').AsInteger       := qryBeneficiario.FieldByName('CD_PESSOA_ENTID').AsInteger;
      ParamByName('CD_PESSOA_PATROC').AsInteger      := qryBeneficiario.FieldByName('CD_PESSOA_PATROC').AsInteger;
      ParamByName('CD_PLANO').AsInteger              := qryBeneficiario.FieldByName('CD_PLANO').AsInteger;
      ParamByName('CD_TIPO_BENEF').AsInteger         := qryBeneficiario.FieldByName('CD_TIPO_BENEF').AsInteger;
      ParamByName('CD_GRAU_DEPENDENCIA').AsInteger   := qryBeneficiario.FieldByName('CD_GRAU_DEPENDENCIA').AsInteger;
      ParamByName('CD_DURACAO').AsInteger            := qryBeneficiario.FieldByName('CD_DURACAO').AsInteger;
      ParamByName('CD_SITUACAO_PLANO').AsInteger     := qryBeneficiario.FieldByName('CD_SITUACAO_PLANO').AsInteger;
      ParamByName('CD_GRAU_INSTRUCAO').AsInteger     := qryBeneficiario.FieldByName('CD_GRAU_INSTRUCAO').AsInteger;
      ParamByName('NO_BENEFICIARIO').AsString        := qryBeneficiario.FieldByName('NO_BENEFICIARIO').AsString;
      ParamByName('NR_MATRICULA').AsInteger          := qryBeneficiario.FieldByName('NR_MATRICULA').AsInteger;
      ParamByName('DT_NASC').AsDateTime              := qryBeneficiario.FieldByName('DT_NASC').AsDateTime;
      ParamByName('IR_SEXO').AsInteger               := qryBeneficiario.FieldByName('IR_SEXO').AsInteger;
      ParamByName('NR_IDADE_BENEFICIARIO').AsInteger := qryBeneficiario.FieldByName('NR_IDADE_BENEFICIARIO').AsInteger;
      ExecSQL;
   End;
End;

procedure TfrmImportaVersao.ImportaTudo;
Begin
   Try
      Screen.Cursor := crSQLWait;

      { Abre as Querys }
      qryTempoParticipante.Open;
      qryValorParticipante.Open;
      qryDependente.Open;

      frmAguarde.Pos := 1;
      frmAguarde.Mostra('Aguarde a importação...');
      frmAguarde.Max := qryParticipante.RecordCount;

      Try
         If Not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;

         GravaVersao;

         While not qryParticipante.EOF do
         Begin
            { Insere Participante }
            InsereParticipantes;

            { Insere Beneficiario }
            qryBeneficiario.Close;
            qryBeneficiario.ParamByName('CD_VERSAO').AsInteger := qryParticipante.FieldByName('CD_VERSAO').AsInteger;
            qryBeneficiario.ParamByName('CD_PARTIC').AsInteger := qryParticipante.FieldByName('CD_PARTIC').AsInteger;
            qryBeneficiario.Open;
            While Not qryBeneficiario.Eof do
            Begin
               InsereBeneficiario;
               qryBeneficiario.Next;
            End;

            { Insere Tempo de Participante }
            While Not qryTempoParticipante.Eof do
            Begin
               InsereTempoParticipante;
               qryTempoParticipante.Next;
            End;

            { Insere Valor do Participante }
            While Not qryValorParticipante.Eof do
            Begin
               InsereValorParticipante;
               qryValorParticipante.Next;
            End;

            { Insere Dependentes }
            While Not qryDependente.Eof do
            Begin
               InsereDependente;

               qryBeneficiario.Close;
               qryBeneficiario.ParamByName('CD_VERSAO').AsInteger := qryDependente.FieldByName('CD_VERSAO').AsInteger;
               qryBeneficiario.ParamByName('CD_PARTIC').AsInteger := qryDependente.FieldByName('CD_DEPENDENTE').AsInteger;
               qryBeneficiario.Open;
               While Not qryBeneficiario.Eof do
               Begin
                  InsereBeneficiario;
                  qryBeneficiario.Next;
               End;

               qryDependente.Next;
            End;

            qryParticipante.Next;

            frmAguarde.Pos := frmAguarde.Pos + 1;
            frmAguarde.Mostra('Aguarde a importação...');
            Application.ProcessMessages;
         End;

         dtmBaseDados.dbBaseDados.Commit;
         ShowMessage('Dados importados com Sucesso !!!');
      Except
         dtmBaseDados.dbBaseDados.RollBack;
         raise;
      End;
   Finally
      qryParticipante.Close;
      qryTempoParticipante.Close;
      qryValorParticipante.Close;
      qryDependente.Close;

      frmAguarde.Apaga;

      Screen.Cursor := crDefault;
   End;
End;

procedure TfrmImportaVersao.BtBtnImportaClick(Sender: TObject);
Var vCampos:String;
begin
   Screen.Cursor := crHourGlass;
   Application.CreateForm(TfrmQueryCondicao, frmQueryCondicao);
   frmQueryCondicao.bbtnConfirmar.Enabled := False;
   frmQueryCondicao.showmodal;

   vCampos    := ' FI_PARTICIPANTE.* ';

   strGuardaSQL.Text := frmQueryCondicao.EditSQLExpressao.Text;

   If frmQueryCondicao.bbtnSair.modalresult = mryes then
   Begin
      qryParticipante.Close;
      qryParticipante.SQL.Text := strGuardaSQL.Text;
      qryParticipante.SQL.Delete(qryParticipante.SQL.Count-1);

      qryParticipante.SQL.Text := StringReplace(qryParticipante.SQL.Text, ' 1 ', vCampos, []);
      qryParticipante.SQL.Text := StringReplace(qryParticipante.SQL.Text, ':CD_VERSAO', sCD_Versao, []);
      qryParticipante.Open;
   End;

   cdsCriticas.DisableControls;

   ImportaTudo;

   cdsCriticas.EnableControls;

   Screen.Cursor := crDefault;
end;

procedure TfrmImportaVersao.FormCreate(Sender: TObject);
begin
   if uGlobal.WG_CD_VERSAO = 0 then
   begin
      MessageDlg('Selecione uma Versão da Base de Trabalho !',
                 mtWarning, [mbOk], 0);
      AbrirForm(frmVersaoBase,TfrmVersaoBase,False );
      close;
   end;

   inherited;

   EdtVersao.Text := frmPrincipal.stbarStatusBar.panels[3].Text;        // versao

   strGuardaSQL := TStringList.Create;

   sCD_Versao := IntToStr(uGlobal.WG_CD_VERSAO);

   pcCriticas.ActivePage := tbsDetalhe;

   If not qryCargos.Active     then qryCargos.Open;
   If not qryPlano.Active      then qryPlano.Open;
   If not qryListaTempo.Active then qryListaTempo.Open;
   If not qryListaValor.Active then qryListaValor.Open;
   If not cdsCriticas.Active   then cdsCriticas.CreateDataSet;
end;

procedure TfrmImportaVersao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   FreeAndNil(strGuardaSQL);

   qryCargos.Close;
   qryPlano.Close;

   qryListaTempo.Close;
   qryListaValor.Close;
   cdsCriticas.Close;

   inherited;        
end;

procedure TfrmImportaVersao.BtInsClick(Sender: TObject);
begin
   inherited;
   BtIns.Down := true;
   btAlt.Enabled  := False;
   BtExcl.Enabled := False;

   pcCriticas.ActivePage := tbsDados;
   pcTipos.ActivePage := tbsTempo;
   dbcbTipoTempo.SetFocus;

   cdsCriticas.Insert;
end;

procedure TfrmImportaVersao.bbtnCancelarDetClick(Sender: TObject);
begin
   inherited;

   cdsCriticas.Cancel;

   btIns.Down := False;
   btAlt.Down := False;

   btIns.Enabled  := True;
   btAlt.Enabled  := True;
   btExcl.Enabled := True;
   pcCriticas.ActivePage := tbsDetalhe;
end;

procedure TfrmImportaVersao.bbtnOkDetClick(Sender: TObject);
begin
   inherited;


   cdsCriticas.FieldByName('TP_CRITICA').AsInteger  := pcTipos.ActivePageIndex;

   If pcTipos.ActivePageIndex < 2 Then
      cdsCriticas.FieldByName('ID_CARGO').AsInteger := qryCargos.FieldByName('CD_TIPO_CAT_PROF_ESP').AsInteger
   Else
      cdsCriticas.FieldByName('ID_CARGO').Clear;

   Case pcTipos.ActivePageIndex of
      0:cdsCriticas.FieldByName('ID_ALTERADOR').AsInteger := qryListaTempo.FieldByName('CD_TIPO_TEMPO').AsInteger;
      1:cdsCriticas.FieldByName('ID_ALTERADOR').AsInteger := qryListaValor.FieldByName('CD_TIPO_VALOR').AsInteger;
      2:Begin
           cdsCriticas.FieldByName('ID_ALTERADOR').AsInteger := qryPlano.FieldByName('CD_PLANO').AsInteger;
           cdsCriticas.FieldByName('VL_ALTERADOR').AsString  := qryPlano.FieldByName('CD_PLANO').AsString;
        End;
   End;

   cdsCriticas.Post;

   bbtnCancelarDetClick(Self);
end;

procedure TfrmImportaVersao.btAltClick(Sender: TObject);
begin
   inherited;
   If cdsCriticas.IsEmpty Then Exit;
   
   btAlt.Down := true;
   BtIns.Enabled  := False;
   BtExcl.Enabled := False;

   pcTipos.ActivePageIndex := cdsCriticas.FieldByName('TP_CRITICA').AsInteger;

   Case pcTipos.ActivePageIndex of
      0:dbcbTipoTempo.SetFocus;
      1:dbcbTipoValor.SetFocus;
      2:dbcbPlano.SetFocus;
   End;

   pcCriticas.ActivePage := tbsDados;
   cdsCriticas.Edit;
end;

procedure TfrmImportaVersao.BtExclClick(Sender: TObject);
begin
   inherited;

   If cdsCriticas.IsEmpty Then Exit;

   If MessageBox(0,'Deseja realmente apagar este registro ?','Cálculo Atuarial',4) = IdYes Then
      cdsCriticas.Delete;
end;

procedure TfrmImportaVersao.dbedAlteradoValorKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   If not (Key in ['0'..'9', ',',#8]) then Key := #0;
end;

procedure TfrmImportaVersao.dbeAlteradoTempoKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;

   If dbcbCondicaoTempo.ItemIndex = 0 Then
   Begin
      If not (Key in ['0'..'9', '/', #8]) then Key := #0
   End
   Else
   Begin
      If not (Key in ['0'..'9', #8]) then Key := #0;
   End;
End;

procedure TfrmImportaVersao.dbeAlteradoTempoExit(Sender: TObject);
begin
   inherited;

   If (dbcbCondicaoTempo.ItemIndex = 0) and
      (cdsCriticas.FieldByName('VL_ALTERADOR').AsString <> '') and
      (Not Valida_Data(cdsCriticas.FieldByName('VL_ALTERADOR').AsString)) Then
   Begin
      cdsCriticas.FieldByName('VL_ALTERADOR').AsString := '';
      ShowMessage('      Data inválida      ');
   End;
end;

procedure TfrmImportaVersao.edDesNovaVersaoChange(Sender: TObject);
begin
   inherited;
   BtBtnImporta.Enabled := (edDesNovaVersao.Text <> '');
end;

procedure TfrmImportaVersao.dbcbCondicaoTempoChange(Sender: TObject);
begin
   inherited;
   cdsCriticas.FieldByName('VL_ALTERADOR').AsString := '';
end;

end.
