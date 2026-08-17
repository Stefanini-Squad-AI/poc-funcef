{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
unit uCMTreeViewMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, db, dbctrls, Consts, ComStrs, CommCtrl, Imglist;

type
  TClickEvent = procedure(Sender:TObject) of object;

  TCMTreeViewMT = class(TCustomTreeView)
  private
    { Private declarations }
     FMascara : string;
     FDataLink : TDataLink;
     FListaGraus : TList;
     FListaChave : TStringList;
     FListaDescr : TStringList;
     FListaTemp : TStringList;
     FTabela : TDataSet;
     FTamFiltro : integer;
     FChaveFiltro : string;
     FTamFolha : integer;
     FImagem : TImageList;
     FOnChange : TNotifyEvent;
     FValorChave : string;
     FChaveDeleta : string;
     FBeforeDeleteOri : TDataSetNotifyEvent;
     FAfterDeleteOri : TDataSetNotifyEvent;
     FBeforePostOri : TDataSetNotifyEvent;
     FAfterScrollOri : TDataSetNotifyEvent;
     FPodeNavegar : Boolean;
     FCampoDescricao: String;
     FCampoChave: String;
     FCampoTipo: String;

     function GetDataSource: TDataSource;
     procedure SetDataSource(Value:TDataSource);
     procedure CriaListaMascara(mascara : string);
     function AchaTamanhoFilho(Chave : string): integer;
     function FormataChave(Chave : string): string;
     procedure MontaNo(Pai : TTreeNode);
     procedure CriaArvore;
     procedure AntesDeletaQuery(DataSet:TDataset);
     procedure DepoisDeletaQuery(DataSet:TDataset);
     procedure PostQuery(DataSet: TDataSet);
     procedure AfterScroll(DataSet: TDataSet);
     function Pai(Chave:string):string; {Dado uma chave acha o seu pai}
     procedure AbreNo(sChave:string);
     procedure PoeImagem(No : TTreeNode; Tipo : LongInt);
     function ESintetica( sTipo:string):Boolean;
    procedure SetCampoChave(const Value: String);
    procedure SetCampoDescricao(const Value: String);
    procedure SetCampoTipo(const Value: String);

  protected
    { Protected declarations }
    property OnGetImageIndex;

     procedure CNNotify(var Message: TWMNotify); message CN_NOTIFY;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure MontaArvore;
    procedure GetImgIdx(Sender:TObject;Node:TTreeNode);
    procedure GetSelIdx(Sender:TObject;Node:TTreeNode);
    procedure Filtra(DataSet: TDataSet; var Accept: Boolean);
    property Selected;
    property ValorChave : string read FValorChave write FValorChave;

  published
    { Published declarations }
    property Items;
    property PodeNavegar : Boolean read FPodeNavegar write FPodeNavegar;
    property Mascara : string read FMascara write CriaListaMascara;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property CampoChave: String read FCampoChave write SetCampoChave;
    property CampoDescricao: String read FCampoDescricao write SetCampoDescricao;
    property CampoTipo: String read FCampoTipo write SetCampoTipo;
    property OnClick;
    property OnDblClick;
    property OnExit;
    property OnChanging;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property ShowButtons;
    property ShowLines;
    property ShowRoot;
    property Font;
    property PopUpMenu;
    property Align;
    property Visible;

  end;

implementation

{uCMTreeViewMT}

constructor TCMTreeViewMT.Create(AOwner:TComponent);
begin
     inherited Create(AOwner);
     FDataLink := TDataLink.Create;
     FDataLink.BufferCount := 2000;
     FListaChave := TStringList.Create;
     FListaTemp := TStringList.Create;
     FListaDescr := TStringList.Create;
     FListaGraus := TList.Create;
     FListaChave.Sorted := false;
     ReadOnly := true;
     HideSelection := false;
     SortType := stText;
     ShowButtons := true;
     ShowRoot := true;
     ShowLines := true;
     FImagem := TImageList.CreateSize(14,14);
     FImagem.Masked := false;
     FImagem.ResourceLoad(rtBitMap, 'PASTAFECHADA', clNone);
     FImagem.ResourceLoad(rtBitMap, 'PASTAABERTA', clNone);
     FImagem.ResourceLoad(rtBitMap, 'FOLHA', clNone);
     OnGetImageIndex := GetImgIdx;
     OnGetSelectedIndex := GetSelIdx;
     FPodeNavegar := true;
     FCampoChave := '';
     FCampoDescricao := '';
     FCampoTipo := '';
     Images := FImagem;
end;

destructor TCMTreeViewMT.Destroy;
begin
     FDataLink.Free;
     FListaChave.Free;
     FListaTemp.Free;
     FListaDescr.Free;
     FListaGraus.Free;
     FImagem.Free;
     inherited Destroy;
end;

function TCMTreeViewMT.GetDataSource: TDataSource;
begin
     Result := FDataLink.DataSource;
end;

procedure TCMTreeViewMT.SetDataSource(Value: TDataSource);
begin
     if Value <> nil then
     begin
          FDataLink.DataSource := Value;
          Value.FreeNotification(Self);
     end;
end;

procedure TCMTreeViewMT.CriaListaMascara(mascara : string);
var iMasc, i : integer;
begin
     FMascara := mascara ;
     if not (FMascara = '') then
     begin
         iMasc := 0;
         FListaGraus.Clear;
         for i:= 1 to Length(FMascara) do
         begin
              if Copy(FMascara,i,1) = '.' then
              begin
                 FListaGraus.Add(TObject(iMasc));
              end
              else
                Inc(iMasc);
         end;
         FListaGraus.Add(TObject(iMasc));
         FTamFolha := iMasc;
     end;
end;

function TCMTreeViewMT.AchaTamanhoFilho(Chave : string):integer;
var tamanho, i : integer;
begin
     Tamanho := Length(Chave);
     Result := 0;
     for i := 0 to (FListaGraus.Count-1) do
         if (Tamanho = Integer(FListaGraus[i])) then
         begin
            if i = FListaGraus.Count-1 then
               Result := 0
            else
                Result := Integer(FListaGraus[i+1]);
            break;
         end;
end;


procedure TCMTreeViewMT.MontaArvore;
begin
     if FTabela <> nil then
        FTabela.AfterScroll := nil;

     if (FDataLink.Active) and
        (FCampoChave <> '') and
        (fCampoDescricao <> '') and
        (FMascara <> '') then
     begin
          if FDataLink.Active then
          begin
             FTabela := FDataLink.DataSet;
             FTabela.OnFilterRecord := Filtra;
             FBeforeDeleteOri := FTabela.BeforeDelete;
             FBeforePostOri := FTabela.BeforePost;
             FAfterScrollOri := FTabela.AfterScroll;
             FTabela.BeforeDelete := AntesDeletaQuery;
             FTabela.AfterDelete := DepoisDeletaQuery;
             FTabela.BeforePost := PostQuery;
          end
          else
              FTabela.Open;
          Items.Clear;
          FTabela.First;
          if not FTabela.eof then
             CriaArvore;
          FTabela.AfterScroll := AfterScroll;
     end;
end;

procedure TCMTreeViewMT.GetImgIdx(Sender:TObject;Node:TTreeNode);
begin
     with Node do
          if ImageIndex = 2 then {Analitico}
             ImageIndex := 2
          else
              if Expanded then
                 ImageIndex := 1
              else
                  ImageIndex := 0;

end;

procedure TCMTreeViewMT.GetSelIdx(Sender:TObject;Node:TTreeNode);
begin
     with Node do
          if ImageIndex = 2 then {Sintetica}
             SelectedIndex := 2
          else
              if Expanded then
                 SelectedIndex := 1
              else
                  SelectedIndex := 0;
end;

function TCMTreeViewMT.FormataChave(Chave:string): string;
var strTemp : string;
    i , iGrau : integer;
begin
     iGrau := 0;
     strTemp := '';
     for i := 1 to length(Chave) do
     begin
          strTemp := strTemp+Chave[i];
          if (i = Integer(FListaGraus[iGrau])) and
             (i < length(Chave)) then
          begin
               strTemp := strTemp+'.';
               Inc(iGrau);
          end;
     end;
     Result := strTemp;
end;

procedure TCMTreeViewMT.MontaNo(Pai: TTreeNode);
var i, nChave, nTemp : integer;
    bRegCorrente : TBookmarkStr;
    FListaTipo : TStringList;
begin
     FTabela.AfterScroll := nil;
     FListaTipo := TStringList.Create;
     with Items do
     begin
          FListaTemp.Clear;
          FListaDescr.Clear;
          FListaTipo.Clear;
          bRegCorrente := FTabela.BookMark;

          FTabela.Filtered := false;
          FChaveFiltro := FListaChave[Integer(Pai.Data)];
          FTamFiltro := AchaTamanhoFilho(FChaveFiltro);

          FTabela.Filtered := true;
          FTabela.First;
          while (not FTabela.Eof) do
          begin
               nChave := FListaDescr.Add(FTabela.FieldByName(FCampoDescricao).AsString);
               nTemp := FListaTemp.Add(FTabela.FieldByName(FCampoChave).AsString);
               FListaTemp.Objects[nTemp] := TObject(nChave);
               FListaTipo.Add(FTabela.FieldByName(FCampoChave).AsString);
               if ESintetica(FTabela.FieldByName(FCampoTipo).AsString) then
                  FListaTipo.Objects[nTemp] := TObject(0)
               else
                  FListaTipo.Objects[nTemp] := TObject(1);
               FTabela.Next;
          end;
          FTabela.Filtered := false;
          FListaTemp.Sort;
          FListaTipo.Sort;
          for i := 0 to (FListaTemp.Count-1) do
          begin
               if FListaChave.IndexOf(FListaTemp[i]) < 0 then
               begin
                    nChave := FListaChave.Add(FListaTemp[i]);
                    FListaChave.Objects[nChave] := Items.AddChildObject(Pai, FormataChave(FListaTemp[i])+' - '+FListaDescr[integer(FListaTemp.Objects[i])], TObject(nChave));
                    PoeImagem(TTreeNode(FListaChave.Objects[nChave]), Integer(FListaTipo.Objects[i]))
               end;
          end;
          FTabela.BookMark :=  bRegCorrente;
     end;
     FTabela.AfterScroll := AfterScroll;
     FListaTipo.Free;
end;

procedure TCMTreeViewMT.Filtra(DataSet: TDataSet; var Accept: Boolean);
begin
     Accept := true;
     if FTamFiltro = 0 then
        Accept := false
     else
     begin
          if (Copy(FTabela.FieldByName(FCampoChave).AsString,1,Length(FChaveFiltro)) = FChaveFiltro) and
             (Length(FTabela.FieldByName(FCampoChave).AsString) = FTamFiltro) then
             Accept := true
          else
              Accept := false;
     end;
end;

procedure TCMTreeViewMT.CNNotify(var Message: TWMNotify);
begin
     inherited;
     if (FTabela <> nil) and (FTabela.state = dsBrowse) then
     begin
          if (Selected <> nil) then
          begin
             if (Message.NMHdr^.code = TVN_SELCHANGED) then
                try
                   ValorChave := FListaChave[integer(Selected.Data)];
                   FTabela.Locate(FCampoChave, ValorChave,[]);
                   if (FDataLink.Active) and (not Selected.HasChildren) then
                      MontaNo(Selected);
                   if Assigned(FOnChange) then FOnChange(Self);
                except end;
          end;
     end;
end;

procedure TCMTreeViewMT.CriaArvore;
var i : byte;
    nChave, nTemp : integer;
    FListaTipo : TStringList;
begin
     Items.BeginUpdate;
     FListaTipo := TStringList.Create;
     FListaTemp.Clear;
     FListaDescr.Clear;
     FListaChave.Clear;
     FListaTipo.Clear;
     FTamFiltro := integer(FListaGraus[0]);
     FChaveFiltro := '';

     FTabela.Filtered := true;
     FTabela.First;
     while (not FTabela.Eof) do
     begin
          nChave := FListaDescr.Add(FTabela.FieldByName(FCampoDescricao).AsString);
          nTemp := FListaTemp.Add(FTabela.FieldByName(FCampoChave).AsString);
          FListaTemp.Objects[nTemp] := TObject(nChave);
          nTemp := FListaTipo.Add(FTabela.FieldByName(FCampoChave).AsString);
          if ESintetica(FTabela.FieldByName(FCampoTipo).AsString) then
             FListaTipo.Objects[nTemp] := TObject(0)
          else
              FListaTipo.Objects[nTemp] := TObject(1);
          FTabela.Next;
     end;
     FTabela.Filtered := false;
     FListaTemp.Sort;
     FListaTipo.Sort;

     if FListaTemp.Count > 0 then
     begin
          for i := 0 to (FListaTemp.Count-1) do
          begin
               nChave := FListaChave.Add(FListaTemp[i]);
               FListaChave.Objects[nChave] := Items.AddObject(TopItem, FormataChave(FListaTemp[i])+' - '+FListaDescr[integer(FListaTemp.Objects[i])], TObject(nChave));
               PoeImagem(TTreeNode(FListaChave.Objects[nChave]), Integer(FListaTipo.Objects[nChave]) );
          end;
     end;
     FListaTipo.free;
     Items.EndUpdate;
end;

procedure TCMTreeViewMT.AntesDeletaQuery(DataSet:TDataset);
begin
     if Assigned(FBeforeDeleteOri) then
        FBeforeDeleteOri(DataSet);

     FChaveDeleta := FTabela.FieldByName(FCampoChave).AsString;
end;

procedure TCMTreeViewMT.PostQuery(DataSet:TDataset);
var sPai : string;
    nChave : integer;
    tPai: TTreeNode;
begin
     if Assigned(FBeforePostOri) then
        FBeforePostOri(DataSet);

     nChave := -1;
     if FTabela.state = dsInsert then
     begin
        sPai := Pai(FTabela.FieldByName(FCampoChave).AsString);
        if sPai = '' then
        begin
             nChave := FListaChave.Add(FTabela.FieldByName(FCampoChave).AsString);
             FListaChave.Objects[nChave] := Items.AddObject(TopItem, FormataChave(FTabela.FieldByName(FCampoChave).AsString)+' - '+FTabela.FieldByName(FCampoDescricao).AsString, TObject(nChave));
        end
        else
        begin
             nChave := FListaChave.IndexOf(sPai);
             if nChave >= 0 then
             begin
                  tPai := TTreeNode(FListaChave.Objects[FListaChave.IndexOf(sPai)]);
                  nChave := FListaChave.Add(FTabela.FieldByName(FCampoChave).AsString);
                  FListaChave.Objects[nChave] := Items.AddChildObject(TPai, FormataChave(FTabela.FieldByName(FCampoChave).AsString)+' - '+FTabela.FieldByName(FCampoDescricao).AsString, TObject(nChave));
             end;
        end;
     end
     else
         if FTabela.state = dsEdit then
         begin
              nChave := FListaChave.IndexOf(FTabela.FieldByName(FCampoChave).AsString);
              if nChave >= 0 then
              begin
                   FListaChave[nChave] := FTabela.FieldByName(FCampoChave).AsString;
                   TTreeNode(FListaChave.Objects[nChave]).Text := FormataChave(FTabela.FieldByName(FCampoChave).AsString)+' - '+FTabela.FieldByName(FCampoDescricao).AsString;
              end;
         end;
     if nChave >= 0 then
     begin
          Selected := TTreeNode(FListaChave.Objects[nChave]);
          if ESintetica(FTabela.FieldByName(FCampoTipo).AsString) then
             PoeImagem(TTreeNode(FListaChave.Objects[nChave]), 0)
          else
              PoeImagem(TTreeNode(FListaChave.Objects[nChave]), 1);
     end;
     Refresh;
end;

procedure TCMTreeViewMT.AfterScroll(DataSet:TDataset);
var iAchou: integer;

begin
     if Assigned(FAfterScrollOri) then
        FAfterScrollOri(DataSet);

     FTabela.AfterScroll := nil;

     if (FTabela.FieldByName(FCampoChave).AsString <> '') and (FListaChave.Count > 0) and
        (Items.Count > 0) then
     begin
          iAchou := FListaChave.IndexOf(FTabela.FieldByName(FCampoChave).AsString);
          if iAchou < 0 then
          begin
               AbreNo(FTabela.FieldByName(FCampoChave).AsString);
               iAchou := FListaChave.IndexOf(FTabela.FieldByName(FCampoChave).AsString);
          end;
          Selected := TTreeNode(FListaChave.Objects[iAchou]);
          Selected.Expand(false);
     end;
     FTabela.AfterScroll := AfterScroll;
end;

function TCMTreeViewMT.Pai(Chave:string):string; {Dado uma chave acha o seu pai}
var TamChave,TamPai,i:integer;
begin
     TamChave := Length(Chave);
     TamPai := 0;
     for i := 0 to (FListaGraus.Count-1) do
         if (TamChave = Integer(FListaGraus[i])) then
            break
         else
             TamPai := Integer(FListaGraus[i]);
     Result := Copy(Chave,1,TamPai);
end;

procedure TCMTreeViewMT.DepoisDeletaQuery(DataSet:TDataset);
var bRegCorrente : TBookmarkStr;
    nChave,i, nTemp :integer;
    TNoDeleta:TTreeNode;
begin
     if Assigned(FAfterDeleteOri) then
        FAfterDeleteOri(DataSet);

     bRegCorrente := FTabela.BookMark;
     nChave := FListaChave.IndexOf(FChaveDeleta);
     if nChave >= 0 then
     begin
          // Atualiza o endereçamento da Lista Chave para no Nó
          TNoDeleta := TTreeNode(FListaChave.Objects[nChave]);
          FListaChave.Delete(nChave);
          TNoDeleta.Delete;
          for i := 0 to Items.Count-1 do
          begin
               if Integer(Items[i].Data) > nChave then
               begin
                    nTemp := Integer(Items[i].Data)-1;
                    Items[i].Data := TObject(nTemp);
               end;
          end;
     end;
     FTabela.BookMark := bRegCorrente;
     Invalidate;
end;


procedure TCMTreeViewMT.AbreNo(sChave:string);
var sPai : string;
    ipai : integer;
begin
     sPai := Pai(sChave);
     iPai := FListaChave.IndexOf(sPai);
     if iPai < 0 then
     begin
        AbreNo(sPai);
        iPai := FListaChave.IndexOf(sPai);
     end;
     if FListaChave.Count > 0 then
     begin
          MontaNo(TTreeNode(FListaChave.Objects[iPai]));
          TTreeNode(FListaChave.Objects[iPai]).Expand(true);
     end;
end;

procedure TCMTreeViewMT.PoeImagem( No:TTreeNode; Tipo:LongInt);
begin
     if Tipo = 0 then
     begin
          No.ImageIndex := 0;
          No.SelectedIndex := 0;
     end
     else
     begin
          No.ImageIndex := 2;
          No.SelectedIndex := 2;
     end;
end;

function TCMTreeViewMT.ESintetica( sTipo:string):Boolean;
begin
     if (stipo = '') then
        Result := true
     else
         if stipo[1] in ['s','S'] then
            Result := true
        else
            Result := false;
end;

procedure TCMTreeViewMT.SetCampoChave(const Value: String);
begin
  FCampoChave := Trim(Value);
end;

procedure TCMTreeViewMT.SetCampoDescricao(const Value: String);
begin
  FCampoDescricao := Trim(Value);
end;

procedure TCMTreeViewMT.SetCampoTipo(const Value: String);
begin
  FCampoTipo := Trim(Value);
end;

end.

