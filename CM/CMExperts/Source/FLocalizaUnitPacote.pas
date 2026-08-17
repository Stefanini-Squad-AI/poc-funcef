{ Historico }

{----------------------------------------------------------}
{ Sistema..: Sistema de Controle e Gerência de Compilação  }
{ Autor....: Daniel Begnami                                }
{ Data.....: 26/06/2008                                    }
{----------------------------------------------------------}

unit FLocalizaUnitPacote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Buttons, Menus, TB97, CmDock, uFormManager, fcButton, fcImgBtn,
  fcShapeBtn, fcClearPanel, fcButtonGroup, uResource;

type
  {PACOTE}
  TPacote = packed record
    PacoteDiretorio  : String;
    PacoteNome       : String;
    PacoteModulo     : String;
    PacoteTipo       : String;
  end;
  {CFG}
  TCFG = packed record
    CFGDiretorio     : String;
    CFGNome          : String;
    CFSistema        : String;
    CFGModulo        : String;
  end;
  {DPR}
  TDPR = packed record
    DPRDiretorio     : String;
    DPRNome          : String;
    DPRSistema       : String;
    DPRModulo        : String;
  end;
  {PAS}
  TPas = packed record
    UnitNome : String;
  end;

  TfrmLocalizaUnitPacote = class(TForm)
    edtUnit: TEdit;
    btnAdicionar: TButton;
    btnLocaliza: TButton;
    Panel1: TPanel;
    rgTipoBPL: TRadioGroup;
    mmResult: TMemo;
    mmUnit: TMemo;
    pnPas: TPanel;
    pnPacote: TPanel;
    pnCFG: TPanel;
    rgTipoArquivo: TRadioGroup;
    btnInicializa: TButton;
    btnSalvar: TSpeedButton;
    mmResultDPR: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    pnDPR: TPanel;
    PopupMenu1: TPopupMenu;
    DPKBPL1: TMenuItem;
    DPRProjetos1: TMenuItem;
    SaveDialog1: TSaveDialog;
    procedure FormShow(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnLocalizaClick(Sender: TObject);
    procedure btnInicializaClick(Sender: TObject);
    procedure edtUnitKeyPress(Sender: TObject; var Key: Char);
    procedure rgTipoArquivoClick(Sender: TObject);
    procedure DPKBPL1Click(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure DPRProjetos1Click(Sender: TObject);
  private
    { Private declarations }

    // ----------------------------------
    FmaxLinhaPacote: Integer;
    FCountLInhaCFG: Integer;
    FCountLInhaDPR: Integer;

    Pacotes : array of TPacote;
    Pas     : array of TPas;
    CFG     : array of TCFG;
    DPR     : array of TDPR;

    procedure SetmaxLinhaPacote(const Value: Integer);
    procedure SetCountLInhaCFG(const Value: Integer);
    procedure SetCountLInhaDPR(const Value: Integer);

    procedure CarregaDPRTXT;
    procedure CarregaPacoteTXT;
    procedure CarregaCFGTXT;
    procedure AdicionaPas;
    Function LocalizaPASxPacote(aUnit, aPacote, aTipoBPL : String) : Boolean;
    Function LocalizaPacoteCFG(aPacote, aCFG : String)   : Boolean;
    Function LocalizaPASxDPR(aDPR, aUnit : String) : Boolean;

    // -----------------------------------

    Procedure Inicializa;
    Procedure Localiza;
    Procedure InsereLinhaDupla(aMemo : TMemo);
    procedure InsereLinhaSimples(aMemo : TMemo);
    Procedure InsereNaoAchouPAS(aUnit : String ; aMemo : TMemo);
    procedure InsereBPL(aUnit, aBPL:String);
    procedure InsereSistema(aSistema, aModulo : String ; aMemo : TMemo);
    procedure PulaLinha(aMemo : TMemo);
    procedure InserePASDRP(aUnit :String);
    procedure InsereDPR(aDPR, aSistema, aModulo:String);
    procedure InsereNaoAchouPASDPR(aMemo : TMemo);
  published

    property CountLinhaPacote : Integer read FmaxLinhaPacote write SetmaxLinhaPacote;
    property CountLInhaCFG : Integer read FCountLInhaCFG write SetCountLInhaCFG;
    property CountLInhaDPR : Integer read FCountLInhaDPR write SetCountLInhaDPR;

  end;

var
  frmLocalizaUnitPacote: TfrmLocalizaUnitPacote;

implementation

{$R *.DFM}

{ TPd }


function TfrmLocalizaUnitPacote.LocalizaPacoteCFG(aPacote, aCFG: String): Boolean;
var
  StringListlocalizaCFG : TStringList;
begin
  try
    StringListLocalizaCFG := TStringList.Create;
    if not FileExists(aCFG) then
      exit;
    StringListLocalizaCFG.LoadFromFile(aCFG);
    if pos(UpperCase(Trim(aPacote)), UpperCase(StringListLocalizaCFG.text)) > 0 then
      Result := True
    else
      Result := False;
  finally
    if assigned(StringListLocalizaCFG) then
      FreeAndNil(StringListLocalizaCFG);
  end;
end;

Function TfrmLocalizaUnitPacote.LocalizaPASxPacote(aUnit, aPacote, aTipoBPL : String) : Boolean;
var
  StringListLocalizaPacote : TStringList;
begin
  try
    StringListLocalizaPacote := TStringList.Create;

    if rgTipoBPL.ItemIndex <> 0 then
    begin
      if ((rgTipoBPL.ItemIndex = 1) and (Trim(aTipoBPL) <> '1')) then
        exit;
      if ((rgTipoBPL.ItemIndex = 2) and (Trim(aTipoBPL) <> '0')) then
        exit;
    end;

      if not FileExists(aPacote) then
        exit;
      StringListLocalizaPacote.LoadFromFile(aPacote);
      if pos(UpperCase(Trim(aUnit)), UpperCase(StringListLocalizaPacote.text)) > 0 then
        Result := True
      else
        Result := False;
  finally
    if assigned(StringListLocalizaPacote) then
      FreeAndNil(StringListLocalizaPacote);
  end;
end;

procedure TfrmLocalizaUnitPacote.Localiza;
var
  iPas : Integer;
  iBPL : Integer;
  iCFG : Integer;
  iDPR : Integer;
  bPasBPL : Boolean;
  bPasDPR : Boolean;
  vUnit : String;
begin
  try
    bPasBPL := False;
    bPasDPR := False;
    for iPas := 0 to Length(pas)-1 do
    begin
      pnPas.caption := 'PAS: ' + TrimLeft(pas[iPas].UnitNome);
      Panel1.Refresh;
      { TRATA OS DPK }
      if rgTipoArquivo.ItemIndex <> 2 then
      begin
        InsereLinhaDupla(mmResult);
        for iBPL := 0 to Length(Pacotes)-1 do
        begin
          pnPacote.caption      := 'DPK: '+ TrimLeft(pacotes[iBPL].PacoteNome);
          Panel1.Refresh;
          { Localiza a unit dentro do packages}
          if LocalizaPASxPacote(pas[iPas].UnitNome,
                                Pacotes[iBPL].PacoteDiretorio,
                                Pacotes[iBPL].PacoteTipo) then
          begin
            bPasBPL := True;
            InsereBPL(pas[iPas].UnitNome, pacotes[iBPL].PacoteNome);
            for iCFG := 0 to Length(CFG)-1 do
            begin
              pnCFG.caption      := 'CFG: '+ TrimLeft(CFG[iCFG].CFGNome);
              Panel1.Refresh;
              { Localiza a Packages dentro do arquivo CFG }
              if LocalizaPacoteCFG(copy(pacotes[iBPL].PacoteNome, 1, length(pacotes[iBPL].PacoteNome)-4),
                                                       CFG[iCFG].CFGDiretorio ) then
              begin
                InsereLinhaSimples(mmResult);
                InsereSistema(CFG[iCFG].CFSistema, CFG[iCFG].CFGModulo, mmResult);
              end;
            end;
          end;
        end;
        if not bPasBPL then
          InsereNaoAchouPAS(pas[iPas].UnitNome, mmResult);
        bPasBPL := False;
        InsereLinhaDupla(mmResult);
        PulaLinha(mmResult);
        PulaLinha(mmResult);
      end;

      {TRATA OS DPR}
      if rgTipoArquivo.ItemIndex <> 1 then
      begin
        InsereLinhaDupla(mmResultDPR);
        for iDPR := 0 to Length(DPR)-1 do
        begin
          pnDPR.caption      := 'DPR: '+ TrimLeft(DPR[iDPR].DPRNome);
          Panel1.Refresh;
          if Trim(vUnit) <> Trim(pas[iPas].UnitNome) then
          begin
            vUnit := pas[iPas].UnitNome;
            InserePASDRP(pas[iPas].UnitNome);
          end;
          if LocalizaPASxDPR(DPR[iDPR].DPRDiretorio, pas[iPas].UnitNome) then
          begin
            bPasDPR := True;
            InsereDPR(DPR[iDPR].DPRNome, DPR[iDPR].DPRSistema, DPR[iDPR].DPRModulo);
          end;
        end;
        if not bPasDPR then
          InsereNaoAchouPASDPR(mmResultDPR);
        bPasDPR := False;
        InsereLinhaDupla(mmResultDPR);
        PulaLinha(mmResultDPR);
        PulaLinha(mmResultDPR);
      end;
    end;
  finally
  end;
end;

procedure TfrmLocalizaUnitPacote.Inicializa;
begin
  CarregaPacoteTXT;
  CarregaCFGTXT;
  CarregaDPRTXT;  
  mmResult.Lines.Clear;
  mmResultDPR.Lines.Clear;
  mmUnit.Lines.Clear;
  Panel1.Visible := False;
  btnLocaliza.Enabled := False;
  btnAdicionar.Enabled := True;
  SetLength(Pas,0);
  edtUnit.SetFocus;
end;

procedure TfrmLocalizaUnitPacote.btnLocalizaClick(Sender: TObject);
begin
  try
    Panel1.Visible := True;
    btnSalvar.Enabled := True;
    mmResult.Lines.Clear;
    mmResultDPR.Lines.Clear;
    Self.Localiza;
    Panel1.Visible := False;
  finally
  end;
end;

procedure TfrmLocalizaUnitPacote.CarregaPacoteTXT;
var
  Path : String;
  F  : TextFile;
  S  : String;
  pv : Integer;
  i  : Integer;
  StringList : TStringList;
begin
  try
    path := 'C:\ProjetosCM5\CM\CMExperts\Source\Pacotes.txt';
    StringList := TStringList.Create;
    StringList.LoadFromFile(path);
    CountLinhaPacote := StringList.Count;
    SetLength(Pacotes,CountLinhaPacote);
    AssignFile(F, path);
    Reset(F);
    i := 0;
    while not EOF(F) do
    begin
      Readln(F,S);
      Pv       := Pos(';',S);
      Pacotes[I].PacoteDiretorio := TrimRight(Copy(S,1,Pv-1));
      Delete(S,1,Pv);
      Pv       := Pos(';',S);
      Pacotes[I].PacoteNome      := TrimRight(Copy(S,1,Pv-1));
      Delete(S,1,Pv);
      Pv       := Pos(';',S);
      Pacotes[I].PacoteModulo    := TrimRight(Copy(S,1,Pv-1));
      Delete(S,1,Pv);
      Pv       := Pos(';',S);
      Pacotes[I].PacoteTipo      := TrimRight(Copy(S,1,Pv-1));
      Delete(S,1,Pv);
      inc(i);
    end;
  finally
    if Assigned(StringList) then
      FreeAndNil(StringList);
  end;
end;

procedure TfrmLocalizaUnitPacote.CarregaCFGTXT;
var
  PathCFG : String;
  F  : TextFile;
  S  : String;
  pv : Integer;
  i : Integer;
  StringListCFG : TStringList;
begin
  try
    pathCFG := 'C:\ProjetosCM5\CM\CMExperts\Source\CFG.txt';
    StringListCFG := TStringList.Create;
    StringListCFG.LoadFromFile(pathCFG);
    CountLInhaCFG := StringListCFG.Count;
    SetLength(CFG,FCountLinhaCFG);
    AssignFile(F, pathCFG);
    Reset(F);
    i := 0;
    while not EOF(F) do
    begin
      Readln(F,S);
      Pv       := Pos(';',S);
      CFG[I].CFGDiretorio    := TrimRight(Copy(S,1,Pv-1));
      Delete(S,1,Pv);
      Pv       := Pos(';',S);
      CFG[I].CFGNome         := TrimRight(Copy(S,1,Pv-1));
      Delete(S,1,Pv);
      Pv       := Pos(';',S);
      CFG[I].CFSistema       := TrimRight(Copy(S,1,Pv-1));
      Delete(S,1,Pv);
      Pv       := Pos(';',S);
      CFG[I].CFGModulo       := TrimRight(Copy(S,1,Pv-1));
      Delete(S,1,Pv);
      inc(i);
    end;
  finally
    if Assigned(StringListCFG) then
      FreeAndNil(StringListCFG);
  end;
end;

procedure TfrmLocalizaUnitPacote.SetCountLInhaCFG(const Value: Integer);
begin
  FCountLInhaCFG := Value;
end;

procedure TfrmLocalizaUnitPacote.SetmaxLinhaPacote(const Value: Integer);
begin
  FmaxLinhaPacote := Value;
end;

procedure TfrmLocalizaUnitPacote.FormShow(Sender: TObject);
begin
  Self.Inicializa;
end;

procedure TfrmLocalizaUnitPacote.AdicionaPas;
begin
  SetLength(pas, Length(pas)+1);
  Self.Pas[Length(pas)-1].UnitNome := edtUnit.text;
  mmUnit.Lines.Add(edtUnit.text);
end;

procedure TfrmLocalizaUnitPacote.btnAdicionarClick(Sender: TObject);
begin
  if UpperCase(copy(edtUnit.text, length(edtUnit.text)-3,4)) <> '.PAS' then
  begin
    ShowMessage('São aceitos somente arquivos .PAS');
    edtUnit.SetFocus;
  end
  else
  begin
    AdicionaPas;
    btnLocaliza.Enabled := True;
  end;
  edtUnit.Clear;
  edtUnit.SetFocus;
end;

procedure TfrmLocalizaUnitPacote.InsereLinhaDupla(aMemo : TMemo);
begin
  aMemo.Lines.Add('===========================================');
end;

procedure TfrmLocalizaUnitPacote.InsereNaoAchouPAS(aUnit : String ; aMemo : TMemo);
begin
  aMemo.Lines.add(' U N I T : '+aUnit + ' Unit não encontrada !');
  aMemo.Lines.add('                       Verifique a ortografia.');
end;

procedure TfrmLocalizaUnitPacote.InsereBPL(aUnit, aBPL: String);
begin
  mmResult.Lines.add(' U N I T      : ' +TrimLeft(aUnit));
  mmResult.Lines.add(' B P L         : '+TrimLeft(aBPL));
end;

procedure TfrmLocalizaUnitPacote.InsereLinhaSimples(aMemo : TMemo);
begin
  aMemo.Lines.Add('--------------------------------------------------------------------------------');
end;

procedure TfrmLocalizaUnitPacote.InsereSistema(aSistema, aModulo : String ; aMemo : TMemo);
begin
  aMemo.Lines.Add(' SISTEMA : ' + TrimLeft(aSistema));
  aMemo.Lines.Add(' MÓDULO : ' + TrimLeft(aModulo));
end;

procedure TfrmLocalizaUnitPacote.PulaLinha(aMemo : TMemo);
begin
  aMemo.Lines.Add('');
end;

procedure TfrmLocalizaUnitPacote.btnInicializaClick(Sender: TObject);
begin
  Self.Inicializa;
end;

procedure TfrmLocalizaUnitPacote.edtUnitKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    btnAdicionar.Click;
end;

procedure TfrmLocalizaUnitPacote.CarregaDPRTXT;
var
  PathDPR : String;
  F  : TextFile;
  S  : String;
  pv : Integer;
  i : Integer;
  StringListDPR : TStringList;
begin
  try
    pathDPR := 'C:\ProjetosCM5\CM\CMExperts\Source\DPR.txt';
    StringListDPR := TStringList.Create;
    StringListDPR.LoadFromFile(pathDPR);
    CountLInhaDPR := StringListDPR.Count;
    SetLength(DPR,FCountLinhaDPR);
    AssignFile(F, pathDPR);
    Reset(F);
    i := 0;
    while not EOF(F) do
    begin
      Readln(F,S);
      Pv       := Pos(';',S);
      DPR[I].DPRDiretorio    := TrimRight(Copy(S,1,Pv-1));
      Delete(S,1,Pv);
      Pv       := Pos(';',S);
      DPR[I].DPRNome         := TrimRight(Copy(S,1,Pv-1));
      Delete(S,1,Pv);
      Pv       := Pos(';',S);
      DPR[I].DPRSistema       := TrimRight(Copy(S,1,Pv-1));
      Delete(S,1,Pv);
      Pv       := Pos(';',S);
      DPR[I].DPRModulo       := TrimRight(Copy(S,1,Pv-1));
      Delete(S,1,Pv);
      inc(i);
    end;
  finally
    if assigned(StringListDPR) then
      FreeAndNil(StringListDPR);
  end;
end;

procedure TfrmLocalizaUnitPacote.SetCountLInhaDPR(const Value: Integer);
begin
  FCountLInhaDPR := Value;
end;

function TfrmLocalizaUnitPacote.LocalizaPASxDPR(aDPR, aUnit : String): Boolean;
var
  StringListlocalizaDPR : TStringList;
begin
  try
    StringListLocalizaDPR := TStringList.Create;
    if not FileExists(aDPR) then
      exit;
    StringListLocalizaDPR.LoadFromFile(aDPR);
    if pos(UpperCase(Trim(aUnit)), UpperCase(StringListLocalizaDPR.text)) > 0 then
      Result := True
    else
      Result := False;
  finally
    if assigned(StringListLocalizaDPR) then
      FreeAndNil(StringListLocalizaDPR);
  end;
end;

procedure TfrmLocalizaUnitPacote.InsereDPR(aDPR, aSistema, aModulo:String);
begin
  InsereLinhaSimples(mmResultDPR);
  mmResultDPR.Lines.add(' D P R         : '+TrimLeft(aDPR));
  mmResultDPR.Lines.add(' SISTEMA  : '+TrimLeft(aSistema));
  mmResultDPR.Lines.add(' MÓDULO  : '+TrimLeft(aModulo));
end;

procedure TfrmLocalizaUnitPacote.InserePASDRP(aUnit: String);
begin
  mmResultDPR.Lines.add(' U N I T       : '+aUnit);
end;

procedure TfrmLocalizaUnitPacote.InsereNaoAchouPASDPR(aMemo: TMemo);
begin
  aMemo.Lines.add(' Unit não encontrada ! Verifique a ortografia.');
end;

procedure TfrmLocalizaUnitPacote.rgTipoArquivoClick(Sender: TObject);
begin
  if rgTipoArquivo.ItemIndex = 2 then
    rgTipoBPL.Enabled := False
  else
    rgTipoBPL.Enabled := True;
end;

procedure TfrmLocalizaUnitPacote.DPKBPL1Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    mmResult.Lines.SaveToFile(SaveDialog1.filename);
end;

procedure TfrmLocalizaUnitPacote.btnSalvarClick(Sender: TObject);
begin
  PopupMenu1.Popup(btnSalvar.Left+150, btnSalvar.top+80);
end;

procedure TfrmLocalizaUnitPacote.DPRProjetos1Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    mmResultDPR.Lines.SaveToFile(SaveDialog1.filename);
end;


end.
