{-------------------------------------------------------------------------------

                            CM Soluções Informática

                     FRAME ARVORE DE DADOS COMPLEMENTARES

Pendência    : 23517 / 23518
Módulo       : ComunsImobiliario
Responsável  : Daniel Simões
Data Término : 10/01/2007

--------------------------------------------------------------------------------

********************************************************************************
******************** REGRAS DE INICIALIZAÇÃO DA FRAME **************************

* No Create do Form que irá chamar a frame, deve ser executada a procedure
  pública 'InicializaFrame'...

* No Close do Form que chamou a frame, deve ser executada a procedure pública
  'EncerraFrame'...

* A função 'MontaArvore' deve ser executada aonde é carregado todos os
  ClientDataSet's e Query's do Form para que seja montada a árvore...

********************************************************************************
********************************************************************************

-------------------------------------------------------------------------------}

unit mArvoreCompl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxTL, dxCntner, UMensErro, uSistema, uCtrlOutroDado, uComunsImobiliario,
  uCtrlPadroes, ImgList, uCmSqlParams, Db, Wwdatsrc,
  DBClient, uCMClientDataSet, StdCtrls, Buttons, ExtCtrls, TB97, TB97Tlwn,
  Menus, wwdbdatetimepicker, CMDateTimePicker, Mask, DBCtrls;

type
  {TItem - Responsável por criar os registros em tempo de execução a serem
           carregados para dentro da árvore...}
  TItem = record
    OutroDado        : string; //
    CodCompl         : string; // Código Complemento - Máscara
    Descricao        : string; // Descrição do Complemento
    FlgAnaSint       : string; // Analítico ou Sintético
    TipoDado         : string; // Caracter, Inteiro, Data
    Opcoes           : string; // Lista de Opções
    Valor            : string; //
    OutroDadoXImovel : string; //
    Imovel           : string; //
    Contrato         : string; //
  end;

  pItem = ^TItem;

  TmolArvoreCompl = class(TFrame)
    Cds: TCMClientDataSet;
    ds: TwwDataSource;
    CMSqlParams1: TCMSqlParams;
    imgTreeView: TImageList;
    PopupMenu1: TPopupMenu;
    mnuAlteraConteudo: TMenuItem;
    dxTreeListDados: TdxTreeList;
    TreeListNivel: TdxTreeListColumn;
    TreeListDado: TdxTreeListColumn;
    TreeListConteudo: TdxTreeListColumn;
    TreeListIdOutroDado: TdxTreeListColumn;
    TreeListAnaSint: TdxTreeListColumn;
    TreeListTipoDado: TdxTreeListColumn;
    TreeListOpcao: TdxTreeListColumn;
    TreeListOutroDadoXImovel: TdxTreeListColumn;
    TreeListImovel: TdxTreeListColumn;
    TreeListContrato: TdxTreeListColumn;
    procedure mnuAlteraConteudoClick(Sender: TObject);
    procedure dxTreeListDadosDblClick(Sender: TObject);
    procedure dxTreeListDadosChangeNode(Sender: TObject; OldNode,
      Node: TdxTreeListNode);
  private
    { Private declarations }

    CtrlOutroDado : TCtrlOutroDado;
    NoTemp        : TdxTreeListNode;

    procedure AbreFormEdicao;
    procedure AtualizaConteudo;

    function InsereNo(bPasta:Boolean; NoDestino:TdxTreeListNode; pDesc:pItem): TdxTreeListNode;

  public
    { Public declarations }

    FlgStatus : Boolean;

    procedure InicializaFrame;
    procedure EncerraFrame;
    procedure MontaArvore(const iIdImovel:Integer=-1; const iIdContrato:Integer=-1; const FlgOrigem:String='');

  end;

implementation

uses fAltCompl;

{$R *.DFM}

{ TmolArvoreCompl }

procedure TmolArvoreCompl.InicializaFrame;
begin
  CtrlOutroDado := TCtrlOutroDado.Create;
  CtrlOutroDado.InitializeAs(Padroes);
end;

procedure TmolArvoreCompl.EncerraFrame;
begin
  FreeAndNil(CtrlOutroDado);
end;

function TmolArvoreCompl.InsereNo(bPasta:Boolean; NoDestino:TdxTreeListNode; pDesc:pItem): TdxTreeListNode;
begin
  if (NoDestino=nil) then
    NoTemp := dxTreeListDados.Add
  else
    NoTemp := NoDestino.AddChild;

  NoTemp.Strings[0] := pDesc.CodCompl;
  NoTemp.Strings[1] := pDesc.Descricao;
  NoTemp.Strings[2] := pDesc.Valor;
  NoTemp.Strings[3] := pDesc.OutroDado;
  NoTemp.Strings[4] := pDesc.FlgAnaSint;
  NoTemp.Strings[5] := pDesc.TipoDado;
  NoTemp.Strings[6] := pDesc.Opcoes;
  NoTemp.Strings[7] := pDesc.OutroDadoXImovel;
  NoTemp.Strings[8] := pDesc.Imovel;
  NoTemp.Strings[9] := pDesc.Contrato;

  if (bPasta) then begin
    NoTemp.ImageIndex    := 0;
    NoTemp.SelectedIndex := 1;
  end else begin
    NoTemp.ImageIndex    := 2;
    NoTemp.SelectedIndex := 3;
  end;

  Result := NoTemp;
end;

procedure TmolArvoreCompl.MontaArvore(const iIdImovel:Integer; const iIdContrato:Integer; const FlgOrigem:String);
var sCodPaiGrup : String;
    No          : TdxTreeListNode;
    ItemNo      : pItem;
begin
  TreeListNivel.Sorted := csNone; // Retira a ordenação para montagem da árvore...
  dxTreeListDados.ClearNodes;     // Limpa a TreeList...

  Cds.Data := CtrlOutroDado.LookupDadosComplementares(iIdImovel,iIdContrato,FlgOrigem);

  try
    No := dxTreeListDados.Items[0];

    Cds.DisableControls;
    Cds.First;

    sCodPaiGrup := Cds.FieldByName('CODCOMPL').AsString;

    while not Cds.Eof do begin
      New(ItemNo);
      ItemNo.CodCompl         := Cds.FieldByName('CODCOMPL').AsString;
      ItemNo.Descricao        := Cds.FieldByName('ODODESCRICAO').AsString;
      ItemNo.FlgAnaSint       := Cds.FieldByName('ANASINT').AsString;
      ItemNo.Valor            := Cds.FieldByName('ODIVALOR').AsString;
      ItemNo.OutroDado        := Cds.FieldByName('IDOUTRODADO').AsString;
      ItemNo.TipoDado         := Cds.FieldByName('TIPODADO').AsString;
      ItemNo.Opcoes           := Cds.FieldByName('OPCOES').AsString;
      ItemNo.OutroDadoXImovel := Cds.FieldByName('IDOUTRODADOXIMOVEL').AsString;
      ItemNo.Imovel           := Cds.FieldByName('IDIMOVEL').AsString;
      ItemNo.Contrato         := Cds.FieldByName('IDCONTRATOIMOVEL').AsString;

      if (No<>nil) then begin
        while No.Strings[0]<>Copy(ItemNo.CodCompl,1,Length(No.Strings[0])) do begin
          if (sCodPaiGrup=Copy(ItemNo.CodCompl,1,Length(sCodPaiGrup))) then
            No := No.Parent
          else begin
            sCodPaiGrup := ItemNo.CodCompl;
            No          := nil;
            Break;
          end;
        end;
      end;

      if (ItemNo.FlgAnaSint='S') then
        No := InsereNo(True,No,ItemNo)
      else
        No := InsereNo(False,No,ItemNo);

      Cds.Next;
    end;

  finally
     ItemNo          := nil;
     Cds.EnableControls;
  end;

  TreeListNivel.Sorted := csUp; // Reordena a árvore...
end;

procedure TmolArvoreCompl.mnuAlteraConteudoClick(Sender: TObject);
begin
  if not (Cds.IsEmpty) then begin
    if (FlgStatus=True) then
      if (NoTemp.Strings[4]='A') then
        AbreFormEdicao
      else
        MsgDlg('Não é possível alterar dados sintéticos.','Aviso',mtWarning,[mbOk],0)
    else
      MsgDlg('Sistema não está em modo de Inclusão/Alteração.','Aviso',mtWarning,[mbOk],0);
  end;
end;

procedure TmolArvoreCompl.dxTreeListDadosDblClick(Sender: TObject);
begin
  mnuAlteraConteudoClick(Self); // Abre o menu...
end;

procedure TmolArvoreCompl.dxTreeListDadosChangeNode(Sender:TObject; OldNode,Node:TdxTreeListNode);
begin
  NoTemp := Node;
end;

procedure TmolArvoreCompl.AbreFormEdicao;
var sOpcao, sItem : String;
begin
  Application.CreateForm(TfrmAltCompl, frmAltCompl);
  frmAltCompl.lblConteudo.Caption := NoTemp.Strings[0]+' - '+NoTemp.Strings[1];

  case NoTemp.Strings[5][1] of
    'C':begin // Quando Tipo de Dado for Caracter...
          frmAltCompl.pnlTexto.Visible  := True;
          frmAltCompl.pnlNumero.Visible := False;
          frmAltCompl.pnlData.Visible   := False;
          frmAltCompl.pnlLookup.Visible := False;

          frmAltCompl.memDescricao.Text := NoTemp.Strings[2];
        end;

    'N':begin // Quando Tipo de Dado for Númérico...
          frmAltCompl.pnlTexto.Visible  := False;
          frmAltCompl.pnlNumero.Visible := True;
          frmAltCompl.pnlData.Visible   := False;
          frmAltCompl.pnlLookup.Visible := False;

          if (Trim(NoTemp.Strings[2])<>'') then
            frmAltCompl.edNumero.Value := StrToFloat(trim(NoTemp.Strings[2]));
        end;

    'D':begin // Quando Tipo de Dado for Data...
          frmAltCompl.pnlTexto.Visible  := False;
          frmAltCompl.pnlNumero.Visible := False;
          frmAltCompl.pnlData.Visible   := True;
          frmAltCompl.pnlLookup.Visible := False;

          if (Trim(NoTemp.Strings[2])<>'') then
            frmAltCompl.dbData.Date := StrToDate(trim(NoTemp.Strings[2]));
        end;

    'S':begin // Quando Tipo de Dado for Seleção...
          frmAltCompl.pnlTexto.Visible  := False;
          frmAltCompl.pnlNumero.Visible := False;
          frmAltCompl.pnlData.Visible   := False;
          frmAltCompl.pnlLookup.Visible := True;

          // Monta Lista de itens do Lookup
          sOpcao := NoTemp.Strings[6];

          repeat
            sItem := Copy(sOpcao,1,Pos(';',sOpcao)-1);
            frmAltCompl.cboxLookup.Items.Add(sItem);
            sOpcao := Copy(sOpcao,Pos(';',sOpcao)+1,Length(sOpcao));
          until
            Pos(';',sOpcao) <= 0;

          frmAltCompl.cboxLookup.Items.Add(sOpcao);
          frmAltCompl.cboxLookup.Text := Trim(NoTemp.Strings[2]);
        end;
  end;

  frmAltCompl.ShowModal;
  AtualizaConteudo;
  frmAltCompl.Free;
end;

procedure TmolArvoreCompl.AtualizaConteudo;
begin
  case NoTemp.Strings[5][1] of
    'C':NoTemp.Strings[2] := frmAltCompl.memDescricao.Text;
    'D':NoTemp.Strings[2] := frmAltCompl.dbData.Text;
    'S':NoTemp.Strings[2] := frmAltCompl.cboxLookup.Text;
    'N':if (frmAltCompl.edNumero.Value<>0) then
          NoTemp.Strings[2] := FloatToStr(frmAltCompl.edNumero.Value)
        else
          NoTemp.Strings[2] := '';
  end;

  {Verifica se o campo OUTRODADOXIMOVEL possui algum conteúdo. Se possuir, dá
   um "Edit" no Cds, senão dá um "Insert"...}
  if (Trim(NoTemp.Strings[7])<> '-1') then begin
    Cds.Locate('IDOUTRODADOXIMOVEL',StrToInt(Trim(NoTemp.Strings[7])),[]);

    if (Trim(NoTemp.Strings[2])<>'') then
      Cds.Edit
    else
      Cds.Delete;

  end else begin
    Cds.Insert;
    Cds.FieldByName('IDOUTRODADO').AsInteger := StrToInt(NoTemp.Strings[3]);
  end;

  if (Cds.State in dsEditModes) then
    Cds.FieldByName('ODIVALOR').AsString := NoTemp.Strings[2];
end;

end.
