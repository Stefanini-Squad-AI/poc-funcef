unit FCMEntrada;
{-------------------------------------------------------------------------------
Analista : Alex Pereira
Pendência: 16190
Data     : 18/03/04
Descrição: Montar dinanmicamente a lista de bpls em Ajuda / Sobre
           Ao se clicar duas vezes no logo da CM aparecerão todas as bpls
           utilizadas pelo módulo
Novos métodos: ForEachModule e GravaCDS
-------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, buttons, shellapi, inifiles, ComCtrls,
  IvDictio, IvMulti, IvEMulti, uCMTypes, Db, Wwdatsrc, DBTables,
  CMDatabase, uCmSqlParams, Grids, Wwdbigrd, Wwdbgrid, dBaseDados,
  DBClient, fPackageInfo, uResource, jpeg;

type
  TBplResult = record
    BPL: String;
    Data: TDateTime;
    Camino: String;
    Descricao: String;
    ModuleName: string;
  end;
  TfrmCMEntrada = class(Tform)
    pnlFundo: TPanel;
    Image1: TImage;
    Shape1: TShape;
    ImgCaixa: TImage;
    ImgCm: TImage;
    Bevel2: TBevel;
    lblNomeModulo: TLabel;
    lblVersao: TLabel;
    lblConex: TLabel;
    BvlNomeSistema: TBevel;
    Label2: TLabel;
    imgIcon: TImage;
    BvlBottonSplash: TBevel;
    LblMailCm: TLabel;
    lstGeral: TListBox;
    PnlButtons: TPanel;
    Btngeral: TSpeedButton;
    BtnBibliotecas: TSpeedButton;
    btnOk: TBitBtn;
    Bevel3: TBevel;
    LblMailCm2: TLabel;
    LblDadosCon: TLabel;
    grdbpl: TwwDBGrid;
    dsBpl: TDataSource;
    cdsBpl: TClientDataSet;
    cdsBplBPL: TStringField;
    cdsBplVERSAO: TStringField;
    cdsBplDATA: TDateTimeField;
    cdsBplCAMINHO: TStringField;
    cdsBplDESCRICAO: TStringField;
    ResourceManager: TCMResourceManager;
    procedure FormCreate(Sender: TObject);
    procedure LblMailCmClick(Sender: TObject);
    procedure BtngeralClick(Sender: TObject);
    procedure grdbplTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure ImgCmDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure AjustaControles;
  public
    { Public declarations }
    procedure MostraBotao;
    procedure GravaCDS;
  end;

var
  frmCMEntrada: TfrmCMEntrada;

implementation

uses uSistema, registry;

{$R *.DFM}

procedure TfrmCMEntrada.FormCreate(Sender: TObject);
var
  lI : TListItem;
  Registry: TRegistry;
  sTipoCon: String;
begin
  inherited;

  If ParamCount > 0 Then
     If Copy(UpperCase(ParamStr(1)),1,7) = 'SPLASH=' Then
     Begin
        If (Copy(UpperCase(ParamStr(1)),8,5) = 'SASSE') Or
           (Copy(UpperCase(ParamStr(1)),8,3) = 'CMS') Then
        Begin
           Sistema.LogoCM := (Not (Copy(UpperCase(ParamStr(1)),8,5) = 'SASSE')) ;

           Registry := TRegistry.Create;
           Try
             Registry.RootKey := HKEY_CURRENT_USER;
             try
                Registry.OpenKey('Software\CM', True);
             except
                Registry.OpenKeyReadOnly('Software\CM');
             end;
             if Sistema.GravaRegister then
                Registry.WriteBool('TipoSplash',Sistema.LogoCM);
           Finally
              Registry.CloseKey;
              Registry.Free;
           End;
        End;
     End;

  AjustaControles;

  // 16190 18/03/04 Alex troca o número da versão de acordo com o resource
  ResourceManager.ExeName := Application.ExeName;
  ResourceManager.ObterVersao;
  Sistema.Versao := ResourceManager.Versao;
  // 16190 18/03/04 Alex troca o número da versão de acordo com o resource

  lblNomeModulo.Caption := 'Planus - ' + Sistema.NomeAplicativo;
  lblVersao.Caption := 'Versão ' + Sistema.Versao ;
  lblConex.Caption := 'Conexão: ' + Sistema.AliasServidor + ' \ ' + Sistema.DriverServidor;

  PnlButtons.Visible := false;
  imgIcon.Picture.Icon.Assign(Application.Icon) ;

{ Alex 16179
  lstVersao.Items.Clear;
  for i := 0 to Sistema.VersaoDPL.count-1 do
  begin
       lI := lstVersao.Items.Add;
       lI.Caption := Sistema.NomeDPL[i];
       lI.SubItems.Add(Sistema.VersaoDPL[i]);
       lI.SubItems.Add(Sistema.DataDPL[i]);
  end;
}
  if not cdsBpl.Active then begin
    cdsBpl.CreateDataSet;
    GravaCDS;
  end;
  // fim Alex 16179

  Case Sistema.ConnectionType of
    cntADO: sTipoCon := 'ADO';
    cntBDE: sTipoCon := 'BDE';
    cntDOA: sTipoCon := 'DOA';
    cntIB: sTipoCon := 'IBX';
  End;

  Case Sistema.ConnectionSide of
    cnsClient:
    Begin
      Case Sistema.MidleWareConnection of
        mwcDCOM: sTipoCon := sTipoCon + ' - DCOM: ' + Sistema.DcomComputerName;
        mwcSocket: sTipoCon := sTipoCon + ' - Socket: ' + Sistema.SocketHost;
        mwcWEB: sTipoCon := sTipoCon + ' - Web: ' + Sistema.WebUrl;
      End;

      sTipoCon := 'Thin Client - ' + sTipoCon;
    End;
    cnsServer: sTipoCon := 'Client Server - ' + sTipoCon;
  End;

  LblDadosCon.Caption := sTipoCon;
end;


procedure TfrmCMEntrada.MostraBotao;
begin
   BorderStyle := bsSingle;
   PnlButtons.Visible := true;
   btnOk.visible := true;
   BvlBottonSplash.Visible := False;
   Height := Height + 25;
   Width := Width + 7;
   AjustaControles;
end;

procedure TfrmCMEntrada.LblMailCmClick(Sender: TObject);
begin
  ShellExecute(Application.Handle,nil,Pchar('http://' +  TLabel(Sender).Caption), nil, nil, SW_SHOW);
end;

procedure TfrmCMEntrada.BtngeralClick(Sender: TObject);
begin
  inherited;
  case (Sender As TSpeedButton).Tag of
       0:
       Begin
          lstGeral.BringToFront;
          lstGeral.Visible := True;
       End;
       1:
       Begin
          { Alex 16179
          lstversao.BringToFront;}
          grdbpl.BringToFront;
          lstGeral.Visible := False;

       End;
  end;
end;

procedure TfrmCMEntrada.AjustaControles;
begin
  If Sistema.LogoCM Then
  Begin
      //ImgCm.Left := 186;
      ImgCm.Left := 214;
      //ImgCm.Top := 17;
      ImgCm.Top := 32;
      //LblMailCm.Caption := 'www.cmsolucoes.com.br';
      LblMailCm.Caption := 'www.funcef.com.br';
      //Self.Caption := 'CM Soluções Informática';
      Self.Caption := 'Funcef - Fundação dos Economiários Federais';
      ImgCaixa.Visible := False;
      ImgCm.Visible := True;
  End
  Else
  Begin
      ImgCaixa.Left := 17;
      ImgCaixa.Top := 8;

      LblMailCm.Caption := 'www.caixaconsultoria.com.br';
      LblMailCm.Font.Size := 10;

      Self.Caption := 'Caixa Seguros';
      ImgCaixa.Visible := True;
      ImgCm.Visible := False;


      lstGeral.Items.Clear;
      lstGeral.Items.Add('Atendimento');
      //lstGeral.Items.Add('(061) 429-2751, 429-2771');
      lstGeral.Items.Add(' (61) 3329-1700');
      lstGeral.Items.Add('Direitos reservados a:');
      //lstGeral.Items.Add('Solução TotalPrev');
      lstGeral.Items.Add('Solução Planus');
      //lstGeral.Items.Add('CM Soluções Informática Ltda');
      lstGeral.Items.Add('Funcef - Fundação dos Economiários Federais');
      //lstGeral.Items.Add('Rua Campos Sales, 55 - Tijuca - Rio de Janeiro');
      lstGeral.Items.Add('SCN, Qd. 02, Bl. A, 12º andar');
      lstGeral.Items.Add('Ed. Corporate Financial Center, Brasília - DF');

      LblMailCm2.Visible := True;

      lstGeral.Height := 112;
  End;
end;

procedure TfrmCMEntrada.grdbplTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  cdsBpl.IndexFieldNames := AFieldName;
end;

procedure TfrmCMEntrada.ImgCmDblClick(Sender: TObject);
begin
  Application.CreateForm (TfrmPackageInfo, frmPackageInfo);
  try
    frmPackageInfo.ShowModal;
  finally
    frmPackageInfo.Free;
  end;
end;

procedure TfrmCMEntrada.GravaCDS;
var
  i, iNumOcorr: integer;
begin
  iNumOcorr := ResourceManager.RetornaBplsAssociadas;

  for i:= 0 to iNumOcorr-1 do begin
    cdsBpl.Insert;
    cdsBplBPL.AsString := ResourceManager.BplsAssociadas(i).BPL;
    cdsBplCAMINHO.AsString := ResourceManager.BplsAssociadas(i).Caminho;
    cdsBplDATA.AsDateTime := ResourceManager.BplsAssociadas(i).Data;
    cdsBplDESCRICAO.AsString := ResourceManager.BplsAssociadas(i).Descricao;
    cdsBplVERSAO.AsString := ResourceManager.BplsAssociadas(i).Versao;
    cdsBpl.Post;
  end;
  cdsBpl.First;
end;

end.
