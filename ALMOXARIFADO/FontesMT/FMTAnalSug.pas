{-------------------------------------------------------------------------------
 Data       : 17.08.2006
 Autor      : Antonio Marcos (amf)
 Pendência  : 22582
 Descrição  : Alteração na cor da fonte do grid de clSilver para clBlack
----------------------------------------------------------------------------------}
unit FMTAnalSug;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Grids,
  Wwdbigrd, Wwdbgrid, DBTables, Db, Wwdatsrc, Wwquery, TREdit, FOkCancelar,
  ComCtrls, IvDictio, IvMulti, IvEMulti,uCtrlAnalEstoque, uCtrlArtigo;

type
  TFrmMTAnalSug = class(TfrmSairAjuda)
    grpItem: TGroupBox;
    dbGrdItem: TwwDBGrid;
    btnAceita: TBitBtn;
    BtnRecusar: TBitBtn;
    BtnSCI: TBitBtn;
    gbInformados: TGroupBox;
    Label1: TLabel;
    dbreTRM: TDBRealEdit;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    dbreCM: TDBRealEdit;
    BtConsMedCheck: TBitBtn;
    Label3: TLabel;
    dbrePR: TDBRealEdit;
    BtPtoRedCheck: TBitBtn;
    Label4: TLabel;
    dbreQM: TDBRealEdit;
    BtQtdeMinCheck: TBitBtn;
    Label5: TLabel;
    dbreQC: TDBRealEdit;
    Label6: TLabel;
    dbrePC: TDBRealEdit;
    procedure dbGrdItemExit(Sender: TObject);
    procedure btnAceitaClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure dbreTRMExit(Sender: TObject);
    procedure dbreTRMEnter(Sender: TObject);
    procedure dbreCMExit(Sender: TObject);
    procedure dbreCMEnter(Sender: TObject);
    procedure dbrePRExit(Sender: TObject);
    procedure dbrePREnter(Sender: TObject);
    procedure dbreQMExit(Sender: TObject);
    procedure dbreQMEnter(Sender: TObject);
    procedure dbGrdItemCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure BtTRMCheckClick(Sender: TObject);
    procedure BtConsMedCheckClick(Sender: TObject);
    procedure BtPtoRedCheckClick(Sender: TObject);
    procedure BtQtdeMinCheckClick(Sender: TObject);
    procedure BtnRecusarClick(Sender: TObject);
    procedure BtnSCIClick(Sender: TObject);
    procedure dbreQCExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbreQCEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    AnalEstoque : TCtrlAnalEstoque;
    Artigo      : TCtrlArtigo;
    procedure PegaVariaveis(sTRMCalc,sCMCalc,sPRCalc,sQMCalc:String;var rTRM,rCM,rPR,rQM:Double);
    procedure TrocaTRM;
    procedure TrocaCM;
    procedure TrocaPR;
    procedure TrocaQM;
  public
    { Public declarations }
  end;

var
  FrmMTAnalSug : TFrmMTAnalSug;
  rValAnt    : Double;
  rCM,rPR,rQM,rTRM:Double;
  bPerc     : Boolean;
  bAceita   : Boolean;
implementation

{$R *.DFM}
Uses FMTAnalEstoque, uMensErro, uDataBase, FMTSoliCompra, FTelaAut,
     uModulo,dBaseDados,uSistema;


procedure TFrmMTAnalSug.FormCreate(Sender: TObject);
begin
  inherited;
  AnalEstoque := TCtrlAnalEstoque.Create;
  AnalEstoque.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  AnalEstoque.CdsAnalEstoque      := frmMTAnalEstoque.cds;
  AnalEstoque.CdsItensAnalEstoque := frmMTAnalEstoque.cdsDet;

  Artigo := TCtrlArtigo.Create;
  Artigo.InitializeAs( AnalEstoque );

end;

procedure TFrmMTAnalSug.dbGrdItemExit(Sender: TObject);
begin
  inherited;
  FrmMTAnalEstoque.CdsDet.Edit;
end;

procedure TFrmMTAnalSug.btnAceitaClick(Sender: TObject);
begin
  inherited;
  bAceita := True;
  FrmMTAnalEstoque.Cds.Edit;
  FrmMTAnalEstoque.Cds.FieldByName('FLGACEITA').AsString := 'S';
  FrmMTAnalEstoque.Cds.Post;
  if not AnalEstoque.AplicaOperacaoAnalEstoqueEsp then
     MsgDlg(AnalEstoque.MessageInfo,'Erro',mtError,[mbOk],0);
  Close;
end;

procedure TFrmMTAnalSug.bbtnSairClick(Sender: TObject);
begin
  If Not bAceita Then
     Begin
         If MsgDlg('A análise não foi aceita, ela será recusada. Deseja realmente sair? ','Atenção',MtWarning,[mbYes,MbNo],0) = MrYes Then
             Begin
                FrmMTAnalEstoque.cdsDet.CancelUpdates;
             End
         Else
            Exit;
     End;
  inherited;

end;

procedure TFrmMTAnalSug.dbreTRMExit(Sender: TObject);
begin
  inherited;
  if Format('%17.2f',[rValAnt]) <> Format('%17.2f',[frmMTAnalEstoque.CdsDet.FieldByName('TRMEDINFORMADO').AsFloat]) then
  Begin
     //
     frmMTAnalEstoque.cdsDet.edit;
     frmMTAnalEstoque.cdsDet.FieldByName('TRMEDINFORMADO').AsFloat:=dbreTRM.Value;
     frmMTAnalEstoque.cdsDet.FieldByName('FLGTEMPMEDCALC').AsString:='N';
     frmMTAnalEstoque.cdsDet.post;
     //
     TrocaTRM;
  end;
end;

procedure TFrmMTAnalSug.PegaVariaveis(sTRMCalc,sCMCalc,sPRCalc,sQMCalc:String;var rTRM,rCM,rPR,rQM:Double);
Begin
   If sTRMCalc = 'S' Then
      rTRM:= frmMTAnalEstoque.cdsDet.FieldByName('TRMEDCALCULADO').AsFloat
   Else
      rTRM:= frmMTAnalEstoque.cdsDet.FieldByName('TRMEDINFORMADO').AsFloat;
   //
   If sCMCalc = 'S' Then
      rCM:= frmMTAnalEstoque.cdsDet.FieldByName('CONSMEDCALCULADO').AsFloat
   Else
      rCM:= frmMTAnalEstoque.cdsDet.FieldByName('CONSMEDINFORMADO').AsFloat;
   //
   If sPRCalc = 'S' Then
      rPR:= frmMTAnalEstoque.cdsDet.FieldByName('PONTOREPCALCULADO').AsFloat
   Else
      rPR:= frmMTAnalEstoque.cdsDet.FieldByName('PONTOREPINFORMADO').AsFloat;
   //
   If sQMCalc = 'S' Then
      rQM:= frmMTAnalEstoque.cdsDet.FieldByName('QTDEMINCALCULADA').AsFloat
   Else
      rQM:= frmMTAnalEstoque.cdsDet.FieldByName('QTDEMININFORMADA').AsFloat;
   //
end;

procedure TFrmMTAnalSug.dbreTRMEnter(Sender: TObject);
begin
  inherited;
  frmMTAnalEstoque.cdsDet.Edit;
  rValAnt:=frmMTAnalEstoque.cdsDet.FieldByName('TRMEDINFORMADO').AsFloat;
end;

procedure TFrmMTAnalSug.dbreCMExit(Sender: TObject);
begin
  inherited;
  if Format('%17.2f',[rValAnt]) <> Format('%17.2f',[frmMTAnalEstoque.CdsDet.FieldByName('CONSMEDINFORMADO').AsFloat]) then
  Begin
     //
     frmMTAnalEstoque.cdsDet.edit;
     frmMTAnalEstoque.cdsDet.FieldByName('CONSMEDINFORMADO').AsFloat:=dbreCM.Value;
     frmMTAnalEstoque.cdsDet.FieldByName('FLGCONSMEDCALC').AsString:='N';
     frmMTAnalEstoque.cdsDet.post;
     //
     TrocaCM;
     //
  end;
end;

procedure TFrmMTAnalSug.dbreCMEnter(Sender: TObject);
begin
  inherited;
  frmMTAnalEstoque.cdsDet.Edit;
  rValAnt:=frmMTAnalEstoque.cdsDet.FieldByName('CONSMEDINFORMADO').AsFloat;
end;

procedure TFrmMTAnalSug.dbrePRExit(Sender: TObject);
begin
  inherited;
  if Format('%17.2f',[rValAnt]) <> Format('%17.2f',[frmMTAnalEstoque.CdsDet.FieldByName('PONTOREPINFORMADO').AsFloat]) then
  Begin
     //
     frmMTAnalEstoque.cdsDet.edit;
     frmMTAnalEstoque.cdsDet.FieldByName('PONTOREPINFORMADO').AsFloat:=dbrePR.Value;
     frmMTAnalEstoque.cdsDet.FieldByName('FLGPONTOREPCALC').AsString:='N';
     frmMTAnalEstoque.cdsDet.post;
     //
     TrocaPR;
  end;
end;

procedure TFrmMTAnalSug.dbrePREnter(Sender: TObject);
begin
  inherited;
  frmMTAnalEstoque.cdsDet.Edit;
  rValAnt:=frmMTAnalEstoque.cdsDet.FieldByName('PONTOREPINFORMADO').AsFloat;
end;

procedure TFrmMTAnalSug.dbreQMExit(Sender: TObject);
begin
  inherited;
  if Format('%17.2f',[rValAnt]) <> Format('%17.2f',[frmMTAnalEstoque.CdsDet.FieldByName('QTDEMININFORMADA').AsFloat]) then
  Begin
     //
     frmMTAnalEstoque.cdsDet.edit;
     frmMTAnalEstoque.cdsDet.FieldByName('QTDEMININFORMADA').AsFloat:=dbreQM.Value;
     frmMTAnalEstoque.cdsDet.FieldByName('FLGQTDEMINCALC').AsString:='N';
     frmMTAnalEstoque.cdsDet.post;
     //
     TrocaQM;
  end;
end;

procedure TFrmMTAnalSug.dbreQMEnter(Sender: TObject);
begin
  inherited;
  frmMTAnalEstoque.cdsDet.Edit;
  rValAnt:=frmMTAnalEstoque.cdsDet.FieldByName('QTDEMININFORMADA').AsFloat;
end;

procedure TFrmMTAnalSug.dbGrdItemCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  ABrush.color := clwhite;
  aFont.Color  := clBlack;

  Afont.Size   := 7;
  aFont.Name   := 'Arial';
 //Evento utilizado para mudar a cor das células de status de acordo
  With frmMTAnalEstoque.cdsDet Do
     Begin
          If FieldByName('FLGTEMPMEDCALC').asString = 'S' then
             Begin
                 If Field.Name = 'TRMEDCALCULADO' Then
                    aFont.Color := clBlue;
             End
          Else
             Begin
                 If Field.Name = 'TRMEDINFORMADO' Then
                    aFont.Color := clBlue;
             End;
         //
         If FieldByName('FLGCONSMEDCALC').asString = 'S' then
             Begin
                 If Field.Name = 'CONSMEDCALCULADO' Then
                    aFont.Color := clBlue;
             End
          Else
             Begin
                 If Field.Name = 'CONSMEDINFORMADO' Then
                    aFont.Color := clBlue;
             End;
         //
         If FieldByName('FLGPONTOREPCALC').asString = 'S' then
             Begin
                 If Field.Name = 'PONTOREPCALCULADO' Then
                    aFont.Color := clBlue;
             End
          Else
             Begin
                 If Field.Name = 'PONTOREPINFORMADO' Then
                    aFont.Color := clBlue;
             End;
         //
          If FieldByName('FLGQTDEMINCALC').asString = 'S' then
             Begin
                 If Field.Name = 'QTDEMINCALCULADA' Then
                    aFont.Color := clBlue;
             End
          Else
             Begin
                 If Field.Name = 'QTDEMININFORMADA' Then
                    aFont.Color := clBlue;
             End;
                 If Field.Name = 'PERIDOCOMPRA' Then
                    aFont.Color := clBlue;
          If Field.Name = 'QTDECOMPRAR' Then
                    aFont.Color := clBlue;
          If Field.Name = 'QTDESUGCALCULADA' Then
                    aFont.Color := clBlue;
          If Field.Name = 'QTDESUGAUTO' Then
                    aFont.Color := clBlue;
          If Field.Name = 'SALDOESTOQUE' Then
                    aFont.Color := clBlue;

    End;
   //Faz com que as linhas do grid tenham cores alternadas

   if State <> [gdSelected] then
      Begin
       If ( Field.Name = 'CODARTIGO' ) or ( Field.Name = 'DESCRICAO' ) Then
           Begin
             ABrush.Color := clwhite;
             aFont.Color  := clBlack;
           End;

       if  Highlight then
           begin
              if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
                   Begin
                      ABrush.color := clwhite;
                      aFont.Color  := clBlack;
                   End
              Else
                 Begin
                      ABrush.color := clwhite;
                      aFont.Color  := clBlack;
                 End;
           End;
       End
       Else
          Begin
             ABrush.Color := clHighlight;
             aFont.Color  := clHighlightText;
          End;
       If(gdSelected in State) And ( Highlight ) Then
          Begin
            If ( Field.Name = 'TRMEDCALCULADO' ) Then
               Begin
                   ABrush.Color := clHighlight;
                   aFont.Color  := clHighlightText;
                End;
     // Troca a cor dos itens Checados,quando o grid está selecionado
     With frmMTAnalEstoque.CdsDet Do
       Begin
           If FieldByName('FLGTEMPMEDCALC').asString = 'S' then
             Begin
                 If Field.Name = 'TRMEDCALCULADO' Then
                    aFont.Color := clAqua;
             End
          Else
             Begin
                 If Field.Name = 'TRMEDINFORMADO' Then
                    aFont.Color := clAqua;
             End;
         //
         If FieldByName('FLGCONSMEDCALC').asString = 'S' then
             Begin
                 If Field.Name = 'CONSMEDCALCULADO' Then
                    aFont.Color := clAqua;
             End
          Else
             Begin
                 If Field.Name = 'CONSMEDINFORMADO' Then
                    aFont.Color := clAqua;
             End;
         //
         If FieldByName('FLGPONTOREPCALC').asString = 'S' then
             Begin
                 If Field.Name = 'PONTOREPCALCULADO' Then
                    aFont.Color := clAqua;
             End
          Else
             Begin
                 If Field.Name = 'PONTOREPINFORMADO' Then
                    aFont.Color := clAqua;
             End;
         //
         If FieldByName('FLGQTDEMINCALC').asString = 'S' then
             Begin
                 If Field.Name = 'QTDEMINCALCULADA' Then
                    aFont.Color := clAqua;
             End
          Else
             Begin
                 If Field.Name = 'QTDEMININFORMADA' Then
                    aFont.Color := clAqua;
             End;
          If Field.Name = 'PERIDOCOMPRA' Then
             aFont.Color := clAqua;
          If Field.Name = 'QTDECOMPRAR' Then
             aFont.Color := clAqua;
          If Field.Name = 'QTDESUGCALCULADA' Then
             aFont.Color := clAqua;
          If Field.Name = 'QTDESUGAUTO' Then
             aFont.Color := clAqua;
          If Field.Name = 'SALDOESTOQUE' Then
             aFont.Color := clAqua;
        End;
    End;
end;

procedure TFrmMTAnalSug.BtTRMCheckClick(Sender: TObject);
begin
  inherited;
   frmMTAnalEstoque.CdsDet.edit;
   if frmMTAnalEstoque.CdsDet.FieldByName('FLGTEMPMEDCALC').AsString = 'N' then
      frmMTAnalEstoque.CdsDet.FieldByName('FLGTEMPMEDCALC').AsString := 'S'
   else
      frmMTAnalEstoque.CdsDet.FieldByName('FLGTEMPMEDCALC').AsString := 'N';
   frmMTAnalEstoque.CdsDet.post;
   TrocaTRM;
end;

procedure TFrmMTAnalSug.TrocaTRM;
begin

     PegaVariaveis(frmMTAnalEstoque.CdsDet.FieldByName('FLGTEMPMEDCALC').AsString,
                   frmMTAnalEstoque.CdsDet.FieldByName('FLGCONSMEDCALC').AsString,
                   frmMTAnalEstoque.CdsDet.FieldByName('FLGPONTOREPCALC').AsString,
                   frmMTAnalEstoque.CdsDet.FieldByName('FLGQTDEMINCALC').AsString,rTRM,
                   rCM,rPR,rQM);
     //
     if frmMTAnalEstoque.CdsDet.FieldByName('FLGQTDEMINCALC').AsString = 'S' then
        bPerc:=True
     else
        bPerc:=False;
     //
     frmMTAnalEstoque.CdsDet.edit;
     frmMTAnalEstoque.CdsDet.FieldByName('PONTOREPCALCULADO').AsFloat:= AnalEstoque.CalcPontoRep(rCM,frmMTAnalEstoque.dbedPercMin.Value,rQM,rTRM,bPerc);
     frmMTAnalEstoque.CdsDet.post;
     //
     PegaVariaveis(frmMTAnalEstoque.CdsDet.FieldByName('FLGTEMPMEDCALC').AsString,
                   frmMTAnalEstoque.CdsDet.FieldByName('FLGCONSMEDCALC').AsString,
                   frmMTAnalEstoque.CdsDet.FieldByName('FLGPONTOREPCALC').AsString,
                   frmMTAnalEstoque.CdsDet.FieldByName('FLGQTDEMINCALC').AsString,rTRM,
                   rCM,rPR,rQM);
     frmMTAnalEstoque.CdsDet.edit;
     frmMTAnalEstoque.CdsDet.FieldByName('QTDEMINCALCULADA').AsFloat:=AnalEstoque.CalcQtdeMin(frmMTAnalEstoque.dbedPercMin.Value,rPR);
     frmMTAnalEstoque.CdsDet.post;
     //
     PegaVariaveis(frmMTAnalEstoque.CdsDet.FieldByName('FLGTEMPMEDCALC').AsString,
                   frmMTAnalEstoque.CdsDet.FieldByName('FLGCONSMEDCALC').AsString,
                   frmMTAnalEstoque.CdsDet.FieldByName('FLGPONTOREPCALC').AsString,
                   frmMTAnalEstoque.CdsDet.FieldByName('FLGQTDEMINCALC').AsString,rTRM,
                   rCM,rPR,rQM);
     frmMTAnalEstoque.CdsDet.edit;
     frmMTAnalEstoque.CdsDet.FieldByName('QTDESUGCALCULADA').AsFloat :=AnalEstoque.CalcQtdeSug(rCM,rPR,frmMTAnalEstoque.CdsDet.FieldByName('PERIDOCOMPRA').AsFloat,
                                frmMTAnalEstoque.CdsDet.FieldByName('SALDOESTOQUE').AsFloat,0);
     frmMTAnalEstoque.CdsDet.post;
     //
     frmMTAnalEstoque.CdsDet.edit;
     frmMTAnalEstoque.CdsDet.FieldByName('QTDECOMPRAR').AsFloat:=frmMTAnalEstoque.CdsDet.FieldByName('QTDESUGCALCULADA').AsFloat;
     frmMTAnalEstoque.CdsDet.post;
     //
     frmMTAnalEstoque.CdsDet.edit;
end;

procedure TFrmMTAnalSug.TrocaCM;
begin
     PegaVariaveis(frmMTAnalEstoque.CdsDet.FieldByName('FLGTEMPMEDCALC').AsString,
                   frmMTAnalEstoque.CdsDet.FieldByName('FLGCONSMEDCALC').AsString,
                   frmMTAnalEstoque.CdsDet.FieldByName('FLGPONTOREPCALC').AsString,
                   frmMTAnalEstoque.CdsDet.FieldByName('FLGQTDEMINCALC').AsString,rTRM,
                   rCM,rPR,rQM);
     //
     if frmMTAnalEstoque.CdsDet.FieldByName('FLGQTDEMINCALC').AsString = 'S' then
        bPerc:=True
     else
        bPerc:=False;
     //
     frmMTAnalEstoque.CdsDet.edit;
     frmMTAnalEstoque.CdsDet.FieldByName('PONTOREPCALCULADO').AsFloat:=AnalEstoque.CalcPontoRep(rCM,frmMTAnalEstoque.dbedPercMin.Value,rQM,rTRM,bPerc);
     frmMTAnalEstoque.CdsDet.post;
     //
     PegaVariaveis(frmMTAnalEstoque.CdsDet.FieldByName('FLGTEMPMEDCALC').AsString,
                   frmMTAnalEstoque.CdsDet.FieldByName('FLGCONSMEDCALC').AsString,
                   frmMTAnalEstoque.CdsDet.FieldByName('FLGPONTOREPCALC').AsString,
                   frmMTAnalEstoque.CdsDet.FieldByName('FLGQTDEMINCALC').AsString,rTRM,
                   rCM,rPR,rQM);
     frmMTAnalEstoque.CdsDet.edit;
     frmMTAnalEstoque.CdsDet.FieldByName('QTDEMINCALCULADA').AsFloat:=AnalEstoque.CalcQtdeMin(frmMTAnalEstoque.dbedPercMin.Value,rPR);
     frmMTAnalEstoque.CdsDet.post;
     //
     PegaVariaveis(frmMTAnalEstoque.CdsDet.FieldByName('FLGTEMPMEDCALC').AsString,
                   frmMTAnalEstoque.CdsDet.FieldByName('FLGCONSMEDCALC').AsString,
                   frmMTAnalEstoque.CdsDet.FieldByName('FLGPONTOREPCALC').AsString,
                   frmMTAnalEstoque.CdsDet.FieldByName('FLGQTDEMINCALC').AsString,rTRM,
                   rCM,rPR,rQM);
     frmMTAnalEstoque.CdsDet.edit;
     frmMTAnalEstoque.CdsDet.FieldByName('QTDESUGCALCULADA').AsFloat :=AnalEstoque.CalcQtdeSug(rCM,rPR,frmMTAnalEstoque.CdsDet.FieldByName('PERIDOCOMPRA').AsFloat,
                                frmMTAnalEstoque.CdsDet.FieldByName('SALDOESTOQUE').AsFloat,0);
     frmMTAnalEstoque.CdsDet.post;
     //
     frmMTAnalEstoque.CdsDet.edit;
     frmMTAnalEstoque.CdsDet.FieldByName('QTDECOMPRAR').AsFloat:=frmMTAnalEstoque.CdsDet.FieldByName('QTDESUGCALCULADA').AsFloat;
     frmMTAnalEstoque.CdsDet.post;
     //
     frmMTAnalEstoque.CdsDet.edit;
end;

procedure TFrmMTAnalSug.TrocaPR;
begin
     PegaVariaveis(frmMTAnalEstoque.CdsDet.FieldByName('FLGTEMPMEDCALC').AsString,
                   frmMTAnalEstoque.cdsDet.FieldByName('FLGCONSMEDCALC').AsString,
                   frmMTAnalEstoque.cdsDet.FieldByName('FLGPONTOREPCALC').AsString,
                   frmMTAnalEstoque.cdsDet.FieldByName('FLGQTDEMINCALC').AsString,rTRM,
                   rCM,rPR,rQM);
     //
     frmMTAnalEstoque.cdsDet.edit;
     frmMTAnalEstoque.cdsDet.FieldByName('QTDEMINCALCULADA').AsFloat:=AnalEstoque.CalcQtdeMin(frmMTAnalEstoque.dbedPercMin.Value,rPR);
     frmMTAnalEstoque.cdsDet.post;
     //
     PegaVariaveis(frmMTAnalEstoque.cdsDet.FieldByName('FLGTEMPMEDCALC').AsString,
                   frmMTAnalEstoque.cdsDet.FieldByName('FLGCONSMEDCALC').AsString,
                   frmMTAnalEstoque.cdsDet.FieldByName('FLGPONTOREPCALC').AsString,
                   frmMTAnalEstoque.cdsDet.FieldByName('FLGQTDEMINCALC').AsString,rTRM,
                   rCM,rPR,rQM);
     //
     frmMTAnalEstoque.cdsDet.edit;
     frmMTAnalEstoque.cdsDet.FieldByName('QTDESUGCALCULADA').AsFloat :=AnalEstoque.CalcQtdeSug(rCM,rPR,frmMTAnalEstoque.cdsDet.FieldByName('PERIDOCOMPRA').AsFloat,
                                frmMTAnalEstoque.cdsDet.FieldByName('SALDOESTOQUE').AsFloat,0);
     frmMTAnalEstoque.cdsDet.post;
     //
     frmMTAnalEstoque.cdsDet.edit;
     frmMTAnalEstoque.cdsDet.FieldByName('QTDECOMPRAR').AsFloat:=frmMTAnalEstoque.cdsDet.FieldByName('QTDESUGCALCULADA').AsFloat;
     frmMTAnalEstoque.cdsDet.post;
     //
     frmMTAnalEstoque.cdsDet.edit;
end;

procedure TFrmMTAnalSug.TrocaQM;
begin
     PegaVariaveis(frmMTAnalEstoque.cdsDet.FieldByName('FLGTEMPMEDCALC').AsString,
                   frmMTAnalEstoque.cdsDet.FieldByName('FLGCONSMEDCALC').AsString,
                   frmMTAnalEstoque.cdsDet.FieldByName('FLGPONTOREPCALC').AsString,
                   frmMTAnalEstoque.cdsDet.FieldByName('FLGQTDEMINCALC').AsString,rTRM,
                   rCM,rPR,rQM);
     //
     if frmMTAnalEstoque.cdsDet.FieldByName('FLGQTDEMINCALC').AsString = 'S' then
        bPerc:=True
     else
        bPerc:=False;
     //
     frmMTAnalEstoque.cdsDet.edit;
     frmMTAnalEstoque.cdsDet.FieldByName('PONTOREPCALCULADO').AsFloat:=AnalEstoque.CalcPontoRep(rCM,frmMTAnalEstoque.dbedPercMin.Value,rQM,rTRM,bPerc);
     frmMTAnalEstoque.cdsDet.post;
     //
     PegaVariaveis(frmMTAnalEstoque.cdsDet.FieldByName('FLGTEMPMEDCALC').AsString,
                   frmMTAnalEstoque.cdsDet.FieldByName('FLGCONSMEDCALC').AsString,
                   frmMTAnalEstoque.cdsDet.FieldByName('FLGPONTOREPCALC').AsString,
                   frmMTAnalEstoque.cdsDet.FieldByName('FLGQTDEMINCALC').AsString,rTRM,
                   rCM,rPR,rQM);
     frmMTAnalEstoque.cdsDet.edit;
     frmMTAnalEstoque.cdsDet.FieldByName('QTDEMINCALCULADA').AsFloat:=AnalEstoque.CalcQtdeMin(frmMTAnalEstoque.dbedPercMin.Value,rPR);
     frmMTAnalEstoque.cdsDet.post;
     //
     PegaVariaveis(frmMTAnalEstoque.cdsDet.FieldByName('FLGTEMPMEDCALC').AsString,
                   frmMTAnalEstoque.cdsDet.FieldByName('FLGCONSMEDCALC').AsString,
                   frmMTAnalEstoque.cdsDet.FieldByName('FLGPONTOREPCALC').AsString,
                   frmMTAnalEstoque.cdsDet.FieldByName('FLGQTDEMINCALC').AsString,rTRM,
                   rCM,rPR,rQM);
     frmMTAnalEstoque.cdsDet.edit;
     frmMTAnalEstoque.cdsDet.FieldByName('QTDESUGCALCULADA').AsFloat :=AnalEstoque.CalcQtdeSug(rCM,rPR,frmMTAnalEstoque.cdsDet.FieldByName('PERIDOCOMPRA').AsFloat,
                                frmMTAnalEstoque.cdsDet.FieldByName('SALDOESTOQUE').AsFloat,0);
     frmMTAnalEstoque.cdsDet.post;
     //
     frmMTAnalEstoque.cdsDet.edit;
     frmMTAnalEstoque.cdsDet.FieldByName('QTDECOMPRAR').AsFloat:=frmMTAnalEstoque.cdsDet.FieldByName('QTDESUGCALCULADA').AsFloat;
     frmMTAnalEstoque.cdsDet.post;
     //
     frmMTAnalEstoque.cdsDet.edit;
end;

procedure TFrmMTAnalSug.BtConsMedCheckClick(Sender: TObject);
begin
  inherited;
   frmMTAnalEstoque.cdsDet.edit;
   if frmMTAnalEstoque.cdsDet.FieldByName('FLGCONSMEDCALC').AsString = 'N' then
      frmMTAnalEstoque.cdsDet.FieldByName('FLGCONSMEDCALC').AsString := 'S'
   else
      frmMTAnalEstoque.cdsDet.FieldByName('FLGCONSMEDCALC').AsString := 'N';
   frmMTAnalEstoque.cdsDet.post;
   TrocaCM;
end;

procedure TFrmMTAnalSug.BtPtoRedCheckClick(Sender: TObject);
begin
  inherited;
   frmMTAnalEstoque.cdsDet.edit;
   if frmMTAnalEstoque.cdsDet.FieldByName('FLGPONTOREPCALC').AsString = 'N' then
      frmMTAnalEstoque.cdsDet.FieldByName('FLGPONTOREPCALC').AsString := 'S'
   else
      frmMTAnalEstoque.cdsDet.FieldByName('FLGPONTOREPCALC').AsString := 'N';
   frmMTAnalEstoque.cdsDet.post;
   TrocaPR;
end;

procedure TFrmMTAnalSug.BtQtdeMinCheckClick(Sender: TObject);
begin
  inherited;
   frmMTAnalEstoque.cdsDet.edit;
   if frmMTAnalEstoque.cdsDet.FieldByName('FLGQTDEMINCALC').AsString = 'N' then
      frmMTAnalEstoque.cdsDet.FieldByName('FLGQTDEMINCALC').AsString := 'S'
   else
      frmMTAnalEstoque.cdsDet.FieldByName('FLGQTDEMINCALC').AsString := 'N';
   frmMTAnalEstoque.cdsDet.post;
   TrocaQM;
end;

procedure TFrmMTAnalSug.BtnRecusarClick(Sender: TObject);
begin
  inherited;
  FrmMTAnalEstoque.CdsDet.CancelUpdates;
  Close;
end;

procedure TFrmMTAnalSug.BtnSCIClick(Sender: TObject);
begin
  inherited;
  btnAceita.Click;

  Modulo.bVeioAnalise := True;
  FrmMTSoliCompra := TFrmMTSoliCompra.Create(Application);
  FrmMTSoliCompra.sbtnInserir.Click;
  With FrmMTSoliCompra.cdsDet Do
     Begin
        frmMTAnalEstoque.cdsDet.DisableControls;
        Try
           frmMTAnalEstoque.cdsDet.First;
           While Not frmMTAnalEstoque.cdsDet.Eof Do
              Begin
                 if frmMTAnalEstoque.cdsDet.FieldByName('QTDECOMPRAR').AsFloat <> 0 then
                 Begin
                    Append;
                    FieldByName('IDFORNE').AsInteger  := -1;
                    FieldByName('CODARTIGO').asString := frmMTAnalEstoque.cdsDet.FieldByName('CODARTIGO').asString;
                    FieldByName('CODMEDIDA').asString := Artigo.GetCodMedCusto( frmMTAnalEstoque.cdsDet.FieldByName('CODARTIGO').asString);
                    FieldByName('VALORUN').asFloat    := Artigo.GetCustoMedio(FrmMTAnalEstoque.cdsDet.FieldByName('CODARTIGO').asString,Modulo.iCodCusteio);
                    FieldByName('QTDEPEDIDA').asFloat := frmMTAnalEstoque.cdsDet.FieldByName('QTDECOMPRAR').asFloat;
                    FieldByName('DESCRICAO').asString := frmMTAnalEstoque.cdsDet.FieldByName('DESCRICAO').asString;
                    FieldByName('VALORTOTAL').asFloat := FieldByName('QTDEPEDIDA').asFloat *FieldByName('VALORUN').asFloat;
                 end;
                 frmMTAnalEstoque.cdsDet.Next;
              End;
           Finally
              frmMTAnalEstoque.cdsDet.EnableControls;
           End;
      End;
  FrmMTSoliCompra.CalculaValorTotal;
  FrmMTSoliCompra.sbtnAltDet.Enabled    := True;
  FrmMTSoliCompra.sbtnExcluiDet.Enabled := True;
  FrmMTSoliCompra.FormStyle             := FsNormal;
  FrmMTSoliCompra.Visible               := False;
  FrmMTSoliCompra.ShowModal;

end;

procedure TFrmMTAnalSug.dbreQCExit(Sender: TObject);
begin
  inherited;
  frmMTAnalEstoque.cdsDet.Post;
end;

procedure TFrmMTAnalSug.FormActivate(Sender: TObject);
begin
  inherited;
  frmMTAnalEstoque.cdsDet.First;
end;

procedure TFrmMTAnalSug.dbreQCEnter(Sender: TObject);
begin
  inherited;
  frmMTAnalEstoque.cdsDet.Edit;
end;

procedure TFrmMTAnalSug.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  AnalEstoque.Free;
  Artigo.Free;
end;

end.

