{===============================================================================
Unit    :  uProcura
Form    :  frmProcura

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 12/08/2000

Objetivo: Procura Participantes.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------
19/06/2006    ClaudioR         Inclusão de funcionabilidade de ordenação do re-
                               sultado da pesquisa, tal como o MostraSelect
----------    -----------      -------------------------------------------------

================================================================================}
unit uProcura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, ComCtrls, DBCtrls, Grids,
  Wwdbigrd, Wwdbgrid, DBTables, Wwquery, ImgList;

type
  TfrmProcura = class(TfrmOkCancelar)
    ds: TwwDataSource;
    PageControl: TPageControl;
    TbShtCondicao: TTabSheet;
    Panel1: TPanel;
    TbShtResultado: TTabSheet;
    Panel2: TPanel;
    edtMatricula: TEdit;
    cmbbxMatricula: TComboBox;
    Panel3: TPanel;
    Panel4: TPanel;
    edtNome: TEdit;
    cmbbxNome: TComboBox;
    cmbbxEstadoCivil: TDBLookupComboBox;
    cmbbxSexo: TDBLookupComboBox;
    dbGrd: TwwDBGrid;
    qryEstadoCivil: TwwQuery;
    qrySexo: TwwQuery;
    qryEstadoCivilCD_ESTADO_CIVIL: TFloatField;
    qryEstadoCivilDS_ESTADO_CIVIL: TStringField;
    qrySexoIR_SEXO: TStringField;
    qrySexoDS_SEXO: TStringField;
    dsEstadoCivil: TwwDataSource;
    dsSexo: TwwDataSource;
    bbtnBuscar: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    ImlTitle: TImageList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnBuscarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure cmbbxMatriculaChange(Sender: TObject);
    procedure cmbbxNomeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure dbGrdDblClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure dbGrdCalcTitleImage(Sender: TObject; Field: TField;
      var TitleImageAttributes: TwwTitleImageAttributes);
    procedure dbGrdColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    DataSet: TwwQuery;
    form, CD_VERSAO, DT_GERACAO: String;
  end;

var
  frmProcura: TfrmProcura;
  Saida: boolean;
  SQL: String;

  AFieldName_Aux, Ordem:String;
  bOrdem:Boolean;
  sColunas:String;
  { ------------------------- }

implementation

uses uGlobal, uCalculoAtuarial, uParticipanteHist,
     DRelatsAtuarial, FSimulacaoCalcAtuarial, fParticipante;

{$R *.DFM}

procedure TfrmProcura.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   If Saida then
   Begin
      qrySexo.Close;
      qryEstadoCivil.Close;
      Action := caFree;
   End
   Else
      Action := caNone;
end;

procedure TfrmProcura.bbtnSairClick(Sender: TObject);
begin
   inherited;
   saida := true;
end;

procedure TfrmProcura.bbtnBuscarClick(Sender: TObject);
begin
   saida := false;

   If PageControl.ActivePage = TbShtCondicao then
   Begin
      If (cmbbxMatricula.text = '') and (edtMatricula.text <> '') then
      Begin
         ShowMessage('Informe a máscara de Matrícula !');
         cmbbxMatricula.SetFocus;
         exit;
      End;
      If (cmbbxNome.text = '') and (edtNome.text <> '') then
      Begin
         ShowMessage('Informe a máscara de Nome !');
         cmbbxNome.SetFocus;
         exit;
      End;

      screen.cursor := crHourGlass;
      If (form = 'Participante') or (form = 'Calculo') then
      Begin
         DataSet.SQL.Text := '';
         DataSet.SQL.Text := ' Select distinct a.* from FI_PARTICIPANTE a' + #13 +
                             ' where a.CD_VERSAO = ' + CD_VERSAO;
      End
      Else
         If (form = 'ParticipanteHist') then
         Begin
            DataSet.SQL.Text := '';
            DataSet.SQL.Text := ' Select distinct a.* from FI_BK_PARTICIPANTE a' + #13 +
                                ' where a.CD_VERSAO = ' + CD_VERSAO;
         End
         Else
            If form = 'MemoriaCalculo' then
            Begin
               DataSet.SQL.Text := '';
               DataSet.SQL.Text := ' Select distinct a.*' + #13 +
                                   ' from FI_PARTICIPANTE a, FI_OCOR_CALCULO_ATUARIAL b' + #13 +
                                   ' where a.CD_VERSAO = ' + CD_VERSAO + #13 +
                                   '  and b.DT_GERACAO = to_date('+ #39 + DT_GERACAO + #39 +
                                   ', '+ #39 + 'dd/mm/yyyy hh24:mi:ss' +#39+ ') '+ #13 +
                                   '  and a.CD_VERSAO  = b.CD_VERSAO ' + #13 +
                                   '  and a.CD_PARTIC  = b.CD_PARTIC ';
            End
            Else
               If form = 'MemoriaCalculoHist' then
               Begin
                  DataSet.SQL.Text := '';
                  DataSet.SQL.Text := ' Select distinct a.*' + #13 +
                                      ' from FI_BK_PARTICIPANTE a, FI_BK_OCOR_CALCULO_ATUARIAL b' + #13 +
                                      ' where a.CD_VERSAO = ' + CD_VERSAO + #13 +
                                      '  and b.DT_GERACAO = to_date('+ #39 + DT_GERACAO + #39 +
                                      ', '+ #39 + 'dd/mm/yyyy hh24:mi:ss' +#39+ ') '+ #13 +
                                      '  and a.CD_VERSAO  = b.CD_VERSAO ' + #13 +
                                      '  and a.CD_PARTIC  = b.CD_PARTIC ';
               End;


      If edtMatricula.Text <> '' then
      Begin
         edtMatricula.Text := TRIM(edtMatricula.Text);

         If trim(cmbbxMatricula.Text) = 'é igual a' then
            DataSet.SQL.Add(' and RTrim(a.NR_MATRICULA) = '+#39+ edtMatricula.text +#39)
         Else
            If trim(cmbbxMatricula.Text) = 'possui o texto' then
               DataSet.SQL.Add(' and RTrim(a.NR_MATRICULA) like '+#39+ '%' + edtMatricula.Text + '%'+#39)
            Else
               If trim(cmbbxMatricula.Text) = 'termina com' then
                  DataSet.SQL.Add(' and RTrim(a.NR_MATRICULA) like '+#39+ '%' + edtMatricula.Text + #39)
               Else
                  If trim(cmbbxMatricula.Text) = 'começa com' then
                     DataSet.SQL.Add(' and RTrim(a.NR_MATRICULA) like '+#39+ edtMatricula.Text + '%'+#39);
      End;

      If edtNome.Text <> '' then
      Begin
         edtNome.Text := TRIM(edtNome.Text);

         If trim(cmbbxNome.Text) = 'é igual a' then
            DataSet.SQL.Add(' and a.NO_PESSOA = '+#39+ edtNome.text +#39)
         Else
            If trim(cmbbxNome.Text) = 'possui o texto' then
               DataSet.SQL.Add(' and a.NO_PESSOA like '+#39+ '%' + edtNome.Text + '%'+#39)
            Else
               If trim(cmbbxNome.Text) = 'termina com' then
                  DataSet.SQL.Add(' and a.NO_PESSOA like '+#39+ '%' + edtNome.Text + #39)
               Else
                  If trim(cmbbxNome.Text) = 'começa com' then
                     DataSet.SQL.Add(' and a.NO_PESSOA like '+#39+ edtNome.Text + '%'+#39);
      End;

      If cmbbxEstadoCivil.Text <> '' then
         DataSet.SQL.Add(' and a.CD_ESTADO_CIVIL = ' +
                         qryEstadoCivil.FieldByName('CD_ESTADO_CIVIL').asString);

      If cmbbxSexo.Text <> '' then
         DataSet.SQL.Add(' and a.IR_SEXO = ' + #39 +
                         TRIM(qrySexo.FieldByName('IR_SEXO').asString) + #39);

      DataSet.SQL.Add(' order by a.NR_MATRICULA, a.NO_PESSOA');

      SQL := DataSet.SQL.Text;

      ds.DataSet := DataSet;
      DataSet.Open;

      screen.cursor := crDefault;
      PageControl.ActivePage := TbShtResultado;
      PageControl.OnChange(Sender);
      bbtnConfirmar.Visible := true;
      bbtnBuscar.Visible := false;
   end;
end;

procedure TfrmProcura.bbtnConfirmarClick(Sender: TObject);
var aux: integer;
begin
   AFieldName_Aux := '';

   If (ds.DataSet.IsEmpty) and
      (PageControl.ActivePage = TbShtResultado) then
   Begin
      ShowMessage('Não foi encontrado nenhum Participante !');
      PageControl.ActivePage := TbShtCondicao;
      PageControl.OnChange(Sender);
      exit;
   End;

   saida := true;
   aux := DataSet.FieldByName('CD_PARTIC').asInteger;

   If form = 'Participante' then
   Begin
      frmParticipante.qryPrincipal.Close;
      frmParticipante.qryPrincipal.SQL.Clear;

      frmParticipante.qryPrincipal.SQL.Text := SQL;

      frmParticipante.qryPrincipal.Open;
      frmParticipante.qryPrincipal.Locate('CD_PARTIC', aux, [lopartialKey]);
      frmParticipante.bbtnCancelar.Click;
   End;

   If form = 'ParticipanteHist' then
   Begin
      frmParticipanteHist.qryPrincipal.Close;
      frmParticipanteHist.qryPrincipal.SQL.Clear;

      frmParticipanteHist.qryPrincipal.SQL.Text := SQL;

      frmParticipanteHist.qryPrincipal.Open;
      frmParticipanteHist.qryPrincipal.Locate('CD_PARTIC', aux, [lopartialKey]);
      frmParticipanteHist.bbtnCancelar.Click;
   End;

  If form = 'Calculo' then                         
      FrmSimulacaoCalcAtuarial.w_cd_partic := aux;       // Trocada a form que irá receber o IDParticipante

   If form = 'MemoriaCalculo' then
   Begin
      // Alterado o relatório para atender pelo Regra
      dtmRelatsAtuarial.QryCalcAtuarial.Close;
      dtmRelatsAtuarial.QryCalcAtuarial.ParamByName('CD_PARTIC').asInteger := aux;
      dtmRelatsAtuarial.QryCalcAtuarial.ParamByName('CD_PESSOA_ENTID').asInteger := WG_CD_PESSOA_ENTID;
      dtmRelatsAtuarial.QryCalcAtuarial.ParamByName('CD_PESSOA_PATROC').asInteger := WG_CD_PESSOA_PATROC;
      dtmRelatsAtuarial.QryCalcAtuarial.ParamByName('CD_PLANO').asInteger := WG_CD_PLANO;
      dtmRelatsAtuarial.QryCalcAtuarial.ParamByName('CD_VERSAO').asInteger := WG_CD_VERSAO;
      dtmRelatsAtuarial.QryCalcAtuarial.ParamByName('DT_GERACAO').asDateTime := strToDateTime(DT_GERACAO);
      dtmRelatsAtuarial.QryCalcAtuarial.Open;

      dtmRelatsAtuarial.rpCalcAtuarial.Print;
   End;

   If form = 'MemoriaCalculoHist' then
   begin
      dtmRelatsAtuarial.QryFormulasHist.Close;
      dtmRelatsAtuarial.QryOcorCalculoHist.Close;
      dtmRelatsAtuarial.QryGFormulasHist.Close;

      dtmRelatsAtuarial.QryGFormulasHist.ParamByName('CD_PARTIC').asInteger := aux;
      dtmRelatsAtuarial.QryGFormulasHist.ParamByName('CD_VERSAO').asInteger := StrToInt(CD_VERSAO);
      dtmRelatsAtuarial.QryGFormulasHist.ParamByName('DT_GERACAO').asDateTime := strToDateTime(DT_GERACAO);

      dtmRelatsAtuarial.QryGFormulasHist.Open;
      dtmRelatsAtuarial.QryFormulasHist.Open;
      dtmRelatsAtuarial.QryOcorCalculoHist.Open;

      dtmRelatsAtuarial.rpMemoriaCalculoHist.Print;
   End;

   inherited;
end;

procedure TfrmProcura.cmbbxMatriculaChange(Sender: TObject);
begin
   edtMatricula.SetFocus;
end;

procedure TfrmProcura.cmbbxNomeChange(Sender: TObject);
begin
   edtNome.SetFocus;
end;

procedure TfrmProcura.FormShow(Sender: TObject);
begin
   inherited;
   PageControl.ActivePage := TbShtCondicao;

   If Panel1.Visible then
     qrySexo.Open;

   If Panel3.Visible then
     qryEstadoCivil.Open;

   PageControl.OnChange(Sender);

   cmbbxNome.ItemIndex := 0;
   cmbbxMatricula.ItemIndex := 0;
end;

procedure TfrmProcura.PageControlChange(Sender: TObject);
begin
   If PageControl.ActivePage = TbShtCondicao then
   Begin
      bbtnConfirmar.Visible := false;
      bbtnBuscar.Visible := true;
   End
   Else
   Begin
      bbtnConfirmar.Visible := true;
      bbtnBuscar.Visible := false;
   End
end;

procedure TfrmProcura.dbGrdDblClick(Sender: TObject);
begin
   bbtnConfirmar.Click;
end;

procedure TfrmProcura.bbtnCancelarClick(Sender: TObject);
begin
   If PageControl.ActivePage = TbShtResultado then
   Begin
      PageControl.ActivePage := TbShtCondicao;
      PageControl.onChange(Sender);
      exit;
   End;
   inherited;
   saida := true;
end;

procedure TfrmProcura.dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
Var lstColunas:String;
    N:Integer;
begin
   inherited;

   If SColunas <> '' Then                 // Exibe as colunas da maneira 
      dbGrd.Selected.Text := sColunas;    //   escolhida pelo usuario

   If AFieldName <> AFieldName_Aux Then
   Begin
      AFieldName_Aux := AFieldName;
      bOrdem := True;
   End
   Else
    bOrdem := Not bOrdem;

   If bOrdem Then
      Ordem := ' ASC'
   Else
      Ordem := ' DESC';

   DataSet.Close;
   DataSet.SQL.Text := Copy(DataSet.SQL.Text, 1, POS('ORDER BY ', UpperCase(DataSet.SQL.Text)) + 8) + AFieldName_Aux + Ordem;
   DataSet.Open;
end;

procedure TfrmProcura.dbGrdCalcTitleImage(Sender: TObject; Field: TField;
  var TitleImageAttributes: TwwTitleImageAttributes);
begin
   // Exibe a imagem da "seta" para indicar o tipo de ordenação
   If UpperCase(Field.FieldName) = UpperCase(AFieldName_Aux) Then
   Begin
      TitleImageAttributes.Alignment := taRightJustify;

      If bOrdem Then
         TitleImageAttributes.ImageIndex := 1
      ELse
         TitleImageAttributes.ImageIndex := 0;
   End
   Else
      TitleImageAttributes.ImageIndex := -1;
end;

procedure TfrmProcura.dbGrdColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
Var Aux:String;
    Linha:TStringList;
    N:Integer;
begin
   inherited;

   // Salva na variável "sColunas" a posição das colunas caso sejam alteradas
   sColunas := dbGrd.Selected.Text;
   Linha := TStringList.Create;

   While True do
   Begin
      Aux      := Copy(sColunas, 1, Pos(#$D#$A, sColunas) -1);
      sColunas := Copy(sColunas, Pos(#$D#$A, sColunas) + 2, Length(sColunas));
      Linha.Add(Aux);

      If sColunas = '' Then Break;
   End;

   Linha.Move(FromIndex, ToIndex);

   For N:=0 To Linha.Count -1 do
      sColunas := sColunas + Linha[N] + #$D#$A;
end;

end.
