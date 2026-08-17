unit FCamposBanco;

// Alterações:
{---------------------------------------------------------------------------------------------------
Autor(a)  :
Data      :
Pendencia :
Rotina    :
Alteração :
----------------------------------------------------------------------------------------------------
Autor(a)  :
Data      :
Pendencia :
Rotina    :
Alteração :
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ComCtrls, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Db,
  DBTables, Wwquery, Wwdatsrc, DBCtrls, TB97, IvDictio, IvMulti, IvEMulti,
  TB97Tlbr, ImgList;

type
  TfrmCamposBanco = class(TfrmOkCancelar)
    qryCampos: TwwQuery;
    dsCampos: TwwDataSource;
    ImgLstCampos: TImageList;
    pnlEspera: TPanel;
    Panel3: TPanel;
    Label4: TLabel;
    anEspera: TAnimate;
    trvCampos: TTreeView;
    lblColuna: TLabel;
    sbtnOutros: TSpeedButton;
    procedure trvCamposClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnOutrosClick(Sender: TObject);
  private
    { Private declarations }
    sNomeArq,sNomeColuna : string;
    procedure PreencherTree(tTree : TTreeView;qry : TwwQuery;sChave,sDesc,sDescGrp : string);
  public
    { Public declarations }
    bTreeCamposPreenchida : boolean;
    sNomeEscolhido : string;
    sDescEscolhido : string;
    sIdEscolhido : string;
    function LerCampoBanco(pNomeArq,pNomeColuna : string; var pNomeCampo : string) : string;
  end;

var
  frmCamposBanco: TfrmCamposBanco;

implementation

{$R *.DFM}

function TfrmCamposBanco.LerCampoBanco(pNomeArq,pNomeColuna : string; var pNomeCampo : string) : string;
begin
  Result := '';
  frmCamposBanco.ShowModal;
  if frmCamposBanco.ModalResult = mrOk
  then begin
     Result := sIdEscolhido;
     pNomeCampo := sNomeEscolhido;
  end
  else begin
     Result := '';
     pNomeCampo := ''
  end;
  frmCamposBanco.Close;
end;

procedure TfrmCamposBanco.PreencherTree(tTree : TTreeView;qry : TwwQuery;sChave,sDesc,sDescGrp : string);
var sCodAnterior : string;
    sDescInsert : string;
    iUltIndNivel1 : integer;
    iUltInsert    : integer;
begin
  tTree.Items.Clear;
  sCodAnterior := '';
  iUltIndNivel1 := -1;
  iUltInsert := -1;
  qry.First;
  while not qry.Eof do
  begin
     if sCodAnterior <> qry.FieldByName(sChave).AsString
     then begin
        if Trim(qry.FieldByName(sDescGrp).AsString) = ''
        then sDescInsert := 'Grupo Indeterminado'
        else sDescInsert := qry.FieldByName(sDescGrp).AsString;
        if iUltIndNivel1 = -1
        then begin
           tTree.Items.Add(nil,sDescInsert);
           inc(iUltIndNivel1);
           inc(iUltInsert);
           tTree.Items[iUltIndNivel1].ImageIndex := 0;
        end
        else begin
           tTree.Items.Add(ttree.items[0],sDescInsert);
           inc(iUltInsert);
           iUltIndNivel1 := iUltInsert;
           tTree.Items[iUltIndNivel1].ImageIndex := 0;
        end;
        tTree.Items.AddChild(tTree.Items[iUltIndNivel1],qry.FieldByName(sDesc).AsString);
        inc(iUltInsert);
        tTree.Items[iUltInsert].ImageIndex := 1;
        sCodAnterior := qry.FieldByName(sChave).AsString;
     end
     else begin
        tTree.Items.AddChild(tTree.Items[iUltIndNivel1],qry.FieldByName(sDesc).AsString);
        inc(iUltInsert);
        tTree.Items[iUltInsert].ImageIndex := 1;
     end;
     qry.Next;
  end;
end;

procedure TfrmCamposBanco.trvCamposClick(Sender: TObject);
begin
  inherited;
  if qryCampos.Locate('DescricaoDoCampo',trvCampos.Selected.Text,[loCaseInsensitive])
  then begin
     sNomeEscolhido := qryCampos.FieldByName('NomeDoCampo').AsString;
     sDescEscolhido := qryCampos.FieldByName('DescricaoDoCampo').AsString;
     sIdEscolhido   := qryCampos.FieldByName('IdCampo').AsString;
  end
  else begin
     sNomeEscolhido := '';
     sDescEscolhido := '';
     sIdEscolhido   := '';
  end;
end;

procedure TfrmCamposBanco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  inherited;
end;

procedure TfrmCamposBanco.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
//  inherited;
end;

procedure TfrmCamposBanco.FormActivate(Sender: TObject);
begin
  inherited;
  lblColuna.Caption := 'A coluna '+Trim(sNomeColuna)+' do arquivo '+Trim(sNomeArq)+' corresponde ao campo ... ';
  bTreeCamposPreenchida := False;
  anEspera.Active := True;
  pnlEspera.BringToFront;

  qryCampos.Close;
  qryCampos.SQL.Clear;
  qryCampos.SQL.Add(' SELECT G.CODGRUPOARQUIVO,C.IDCAMPO,C.NOMEDOCAMPO, '+
                    '        C.DESCRICAODOCAMPO, G.DESCGRUPOARQUIVO '+
                    ' FROM   CMPBD C, GRPARQUIVO G, CMPBDGRP CG '+
                    ' WHERE  C.CAMPODOBANCO = 1 AND '+
                    '        C.IDCAMPO = CG.IDCAMPO(+) AND '+
                    '        CG.CODGRUPOARQUIVO = G.CODGRUPOARQUIVO AND '+
                    '         C.ENTIDADE = ''TMPDESC'' '+
                    ' ORDER BY CG.CODGRUPOARQUIVO,C.DESCRICAODOCAMPO ');
  qryCampos.Open;

  PreencherTree(trvCampos,qryCampos,'CodGrupoArquivo','DescricaoDoCampo','DescGrupoArquivo');
  bTreeCamposPreenchida := True;

  anEspera.Active := False;
  pnlEspera.SendToBack;
end;

procedure TfrmCamposBanco.bbtnConfirmarClick(Sender: TObject);
begin
 //  inherited;
  ModalResult := mrOk;
end;

procedure TfrmCamposBanco.bbtnCancelarClick(Sender: TObject);
begin
  //inherited;
  sNomeEscolhido := '';
  sDescEscolhido := '';
  sIdEscolhido   := '';
  ModalResult := mrCancel;
end;

procedure TfrmCamposBanco.sbtnOutrosClick(Sender: TObject);
begin
  inherited;
  bTreeCamposPreenchida := False;
  anEspera.Active := True;
  pnlEspera.BringToFront;

  qryCampos.Close;
  qryCampos.SQL.Clear;
  qryCampos.SQL.Add(' SELECT G.CODGRUPOARQUIVO,C.IDCAMPO,C.NOMEDOCAMPO, '+
                    '        C.DESCRICAODOCAMPO, G.DESCGRUPOARQUIVO '+
                    ' FROM   CMPBD C, GRPARQUIVO G, CMPBDGRP CG '+
                    ' WHERE  C.CAMPODOBANCO = 1 AND '+
                    '        C.IDCAMPO = CG.IDCAMPO(+) AND '+
                    '        CG.CODGRUPOARQUIVO = G.CODGRUPOARQUIVO  '+
                    ' ORDER BY CG.CODGRUPOARQUIVO,C.DESCRICAODOCAMPO ');

  qryCampos.Open;

  PreencherTree(trvCampos,qryCampos,'CodGrupoArquivo','DescricaoDoCampo','DescGrupoArquivo');
  bTreeCamposPreenchida := True;

  anEspera.Active := False;
  pnlEspera.SendToBack;

end;



end.
