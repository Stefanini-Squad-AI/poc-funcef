unit FHistAlt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, fcTreeView, ImgList;

type
  TfrmHistAltera = class(TfrmSairAjuda)
    ImlAltv: TImageList;
    Panel2: TPanel;
    Splitter1: TSplitter;
    TrvAltv: TfcTreeView;
    Panel1: TPanel;
    Panel3: TPanel;
    RedAltv: TRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure TrvAltvChange(TreeView: TfcCustomTreeView;
      Node: TfcTreeNode);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHistAltera: TfrmHistAltera;

implementation

Uses uSistema;

{$R *.DFM}

procedure TfrmHistAltera.FormCreate(Sender: TObject);
Var
  NoPai, NoFilho: TFcTreeNode;
  X: Integer;
begin
  inherited;
  TrvAltv.Items.Clear;

  NoPai := TrvAltv.Items.Add(nil,'Executáveis');
  NoPai.ImageIndex := 0;
  NoPai.SelectedIndex := 0;

  NoFilho := TrvAltv.Items.AddChild(NoPai,Sistema.NomeModulo);
  NoFilho.ImageIndex := 3;
  NoFilho.SelectedIndex := 3;

  NoPai := TrvAltv.Items.Add(nil,'Bibliotecas');
  NoPai.ImageIndex := 1;
  NoPai.SelectedIndex := 1;

  For X:=0 To Sistema.NomeDPL.Count - 1 Do
  Begin
    NoFilho := TrvAltv.Items.AddChild(NoPai,Sistema.NomeDPL[x]);
    NoFilho.ImageIndex := 2;
    NoFilho.SelectedIndex := 2;
  End;
end;

procedure TfrmHistAltera.TrvAltvChange(TreeView: TfcCustomTreeView;
  Node: TfcTreeNode);

  Procedure FormatAlt(FileName: String; Lst: TStrings);
  Var
     X: Integer;
  Begin
     Lst.LoadFromFile(FileName);
     For X:=(Lst.Count - 1) DownTo 0 Do
     Begin
         If Trim(Lst[x])='{CM$ALT' Then
           Lst.Delete(X)
         Else
           If Trim(Lst[x])='CM$ALT}' Then
              Lst.Delete(X)
           Else
               If Pos('CM$VER',Trim(Lst[x])) <> 0
                  Then Lst[X] := 'Versão: ' + Trim(Copy(Trim(Lst[x]),12,Length(Lst[X])))
               Else If Pos('- ',Trim(Lst[x])) = 1 Then
                 Lst[X] := Lst[X]
               Else
               If Pos('Histórico de alterações efetuadas no módulo',Trim(Lst[x])) <> 0 Then
                 Lst[X] := Lst[X];
     End;
  End;

Var
  sFileName, sNomeArquivo: String;
  ListaAux: TStrings;
begin
  inherited;
  If (Node <> nil) Then
  Begin
     sFileName := ExtractFilePath(Application.ExeName) + '..\Alt\';
     sNomeArquivo := '';

     Case Node.ImageIndex of
       0, 1: RedAltv.Lines.Clear;
       3:
       Begin
         sNomeArquivo := ExtractFileName(Application.ExeName);
         sNomeArquivo := Copy(sNomeArquivo,1,Pos('.',sNomeArquivo)) + 'Alt';
       End;
       2:
         sNomeArquivo := ExtractFileName(Sistema.ArqDPL[Node.AbsoluteIndex - 3]) + '.Alt';
     End;

     If sNomeArquivo <> '' Then
     Begin
         RedAltv.Lines.Clear;
         If FileExists(sFileName + sNomeArquivo) Then
         Begin
            ListaAux := TStringList.Create;
            FormatAlt(sFileName + sNomeArquivo,ListaAux);
            RedAltv.Lines.Assign(ListaAux);
            ListaAux.Free;
         End;
     End;
  End;
end;

end.
