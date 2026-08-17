{
 Data       : 07.08.2015
 Sol        : 148922/8841
 PPM        : 1628565
 Autor      : Jonas Otavio
 Rotina     : Botão Ajuda
 Descrição  : Confeccionar documentação do módulo de Empréstimo
-------------------------------------------------------------------------------}

unit fMostraConsultas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, fcTreeView, MontaSelect, Db, DBTables, 
  ImgList, uCmSqlParams, DBClient;

type
  TfrmMostraConsultas = class(TfrmSairAjuda)
    BtnVisualizar: TBitBtn;
    pnlTree: TPanel;
    TreeConsultas: TfcTreeView;
    ImlReports: TImageList;
    ToolbarSep971: TToolbarSep97;
    Cds: TClientDataSet;
    CdsTabelas: TClientDataSet;
    CdsColunas: TClientDataSet;
    CdsWhere: TClientDataSet;
    Sql: TCMSqlParams;
    SqlTabelas: TCMSqlParams;
    SqlColunas: TCMSqlParams;
    SqlWhere: TCMSqlParams;
    procedure BtnVisualizarClick(Sender: TObject);
    procedure TreeConsultasChange(TreeView: TfcCustomTreeView;
      Node: TfcTreeNode);
    procedure FormCreate(Sender: TObject);
    procedure TreeConsultasDblClick(TreeView: TfcCustomTreeView;
      Node: TfcTreeNode; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure bbtnAjudaClick(Sender: TObject);
  private
    { Private declarations }
    Procedure SelecionaFilhos;
    Procedure LimpaMontaSelect(Ms:TMontaSelect);
    Procedure EscreveMontaSelect(Ms:TMontaSelect);
    Procedure VisualizaConsulta;
  public
    { Public declarations }
  end;

var
  frmMostraConsultas: TfrmMostraConsultas;

implementation

Uses uSistema, DAutorizacao;

{$R *.DFM}

Procedure TfrmMostraConsultas.SelecionaFilhos;
Begin
   With SqlTabelas Do
   Begin
      Prepare;
      Params[0].AsFloat := Cds.FieldByName('IDMONTASELECT').AsFloat;
      Open;
   End;

   With SqlColunas Do
   Begin
      Prepare;
      Params[0].AsFloat := Cds.FieldByName('IDMONTASELECT').AsFloat;
      Open;
   End;

   With SqlWhere Do
   Begin
      Prepare;
      Params[0].AsFloat := Cds.FieldByName('IDMONTASELECT').AsFloat;
      Open;
   End;
End;

Procedure TfrmMostraConsultas.LimpaMontaSelect(Ms:TMontaSelect);
Begin
  Ms.ValoresChave.Clear;
  Ms.ItemsBusca.Clear;
  Ms.CamposChave.Clear;
  Ms.Colunas.Clear;
  Ms.Descricao.Clear;
  Ms.Filtro.Clear;
  Ms.Larguras.Clear;
  Ms.Mascaras.Clear;
  Ms.SensivelACaixa.Clear;
  Ms.Tabelas.Clear;
  Ms.TipodeDado.Clear;
End;

Procedure TfrmMostraConsultas.EscreveMontaSelect(Ms:TMontaSelect);
Begin
  //Busca das Tabelas e Preenche as Propriedades do MS
  If (TreeConsultas.Selected <> Nil) And (TreeConsultas.Selected.ImageIndex = 1) Then
  Begin
     Sql.Prepare;
     Sql.Params[0].AsFloat := StrToFloat(TreeConsultas.Selected.StringData);
     Sql.Open;

     SelecionaFilhos;

     LimpaMontaSelect(Ms);

     CdsTabelas.First;
     While Not CdsTabelas.Eof Do
     Begin
        Ms.Tabelas.Add(CdsTabelas.FieldByName('NOMETABELAS').AsString);
        CdsTabelas.Next;
     End;

     CdsWhere.First;
     While Not CdsWhere.Eof Do
     Begin
        Ms.Filtro.Add(CdsWhere.FieldByName('DESCWHERE').AsString);
        CdsWhere.Next;
     End;

     CdsColunas.First;
     While Not CdsColunas.Eof Do
     Begin
       If CdsColunas.FieldByName('FLGCHAVE').AsString = 'S' Then
       Begin
          Ms.CamposChave.Add(CdsColunas.FieldByName('NOMECOLUNA').AsString);
       End
       Else
       Begin
          Ms.Colunas.Add(CdsColunas.FieldByName('NOMECOLUNA').AsString);
          Ms.Descricao.Add(CdsColunas.FieldByName('DESCCOLUNA').AsString);
          Ms.Larguras.Add(CdsColunas.FieldByName('LARGURA').AsString);
          Ms.TipodeDado.Add(CdsColunas.FieldByName('TIPODADO').AsString);
          Ms.Mascaras.Add(CdsColunas.FieldByName('MASCARA').AsString);
          Ms.SensivelACaixa.Add(CdsColunas.FieldByName('SENSIVELACAIXA').AsString);
       End;

       CdsColunas.Next;
     End;
  End;
End;

Procedure TfrmMostraConsultas.VisualizaConsulta;
Var
  MsExecutar :TMontaSelect;
begin
  inherited;
  If ((TreeConsultas.Selected <> Nil) And (TreeConsultas.Selected.ImageIndex = 1)) Then
  Begin
     MsExecutar := TMontaSelect.Create(Self);
     MsExecutar.DataBaseName := 'BaseDados';
     MsExecutar. SalvaConsulta := True;
     Try
        EscreveMontaSelect(MsExecutar);
        MsExecutar.Caption := Cds.FieldByName('NOMEMONTASELECT').AsString;
        MsExecutar.Executar;
     Finally
        MsExecutar.Free;
     End;
  End;
End;

procedure TfrmMostraConsultas.BtnVisualizarClick(Sender: TObject);
begin
  inherited;
  VisualizaConsulta;
end;

procedure TfrmMostraConsultas.TreeConsultasChange(
  TreeView: TfcCustomTreeView; Node: TfcTreeNode);
begin
  inherited;
  BtnVisualizar.Enabled := ((Node <> Nil) And (Node.ImageIndex = 1));
end;

procedure TfrmMostraConsultas.FormCreate(Sender: TObject);
begin
  inherited;
  DtmAutorizacao.MontaArvoreConsulta(TreeConsultas, Sistema.IdEmpresa, Sistema.IdUsuario, Sistema.IdModulo, Sistema.IdEspacesso, False, True);
end;

procedure TfrmMostraConsultas.TreeConsultasDblClick(
  TreeView: TfcCustomTreeView; Node: TfcTreeNode; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  If BtnVisualizar.Enabled Then BtnVisualizar.Click;
end;

procedure TfrmMostraConsultas.bbtnAjudaClick(Sender: TObject);
begin
  inherited;
  // SOL 148922/8841 - Jonas Otavio
  if  (Sistema.IdModulo        = 15)  then
      begin
           Application.HelpContext(230030)
      end;
end;

end.



