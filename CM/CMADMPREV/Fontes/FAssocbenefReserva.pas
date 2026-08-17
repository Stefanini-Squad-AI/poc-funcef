unit FAssocBenefReserva;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Grids, DBGrids, Buttons, StdCtrls, wwdblook, ExtCtrls,
  MAHlpBtn, Db, DBTables, Wwquery, Wwdbigrd, Wwdbgrid, Wwdatsrc,
  cmseldlg, ComCtrls, CMTree, TB97, Menus, DBLookup, IvDictio, IvMulti,
  IvEMulti, TB97Tlbr;

type
  TfrmAssocBenefReserva = class(TfrmOkCancelar)
    seldlgProcura: TcmSelectDlg;
    dsArvore: TwwDataSource;
    qryArvore: TwwQuery;
    qryArvoreIDTIPORESERVA: TFloatField;
    qryArvoreIDPLANOPREV: TFloatField;
    qryArvoreNOME: TStringField;
    qryArvoreANALITICOSINTETI: TStringField;
    qryArvoreCODHIERARQUIA: TStringField;
    qryArvoreFLGCONTROLE: TFloatField;
    qryBenef: TwwQuery;
    qryBenefReserva: TwwQuery;
    dsBenefReserva: TwwDataSource;
    panel2: TPanel;
    lblValores: TLabel;
    dblkpcmbBenef: TwwDBLookupCombo;
    dbgBenefReserva: TwwDBGrid;
    cmtvTipoReserva: TCMTreeView;
    sbtnAssocia: TSpeedButton;
    sbtnDesassocia: TSpeedButton;
    Panel1: TPanel;
    lblTitulo: TLabel;
    pmenu: TPopupMenu;
    mnuAlterar: TMenuItem;
    qryAux: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure dblkpcmbBenefCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure sbtnAssociaClick(Sender: TObject);
    procedure sbtnDesassociaClick(Sender: TObject);
    procedure mnuAlterarClick(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaDbGrid;
  public
    { Public declarations }
  end;

var
  frmAssocBenefReserva: TfrmAssocBenefReserva;
  bCarregaDbGrid: boolean;

implementation

uses
  UMensErro, UAdmPrev, USistema, FLerRegraBenefReserva;

{$R *.DFM}

procedure TfrmAssocBenefReserva.FormShow(Sender: TObject);
begin
  inherited;
  lblTitulo.Caption := ' Reservas do Plano: ' + sNomePlano;

  qryBenef.Close;
  qryBenef.ParamByName('pIdPlanoPrev').AsString := sIdPlano;
  qryBenef.Open;

  qryBenefReserva.Close;

  If frmLerRegraBenefReserva = Nil Then
    Application.CreateForm(TfrmLerRegraBenefReserva, frmLerRegraBenefReserva);

  frmLerRegraBenefReserva.bAlteraRegra := False;

  cmtvTipoReserva.Mascara  := sMascTpReserva;

  bCarregaDbGrid := False;

  qryArvore.Close;
  qryArvore.SQL.Clear;
  qryArvore.SQL.Add(' SELECT * FROM  ' + Sistema.PrefixoServidor + 'RESERVAXPLANO ' +
                    ' WHERE RESERVAXPLANO.IDPLANOPREV = ' + sIdPlano +
                    ' ORDER BY CODHIERARQUIA ');
  qryArvore.Open;

  cmtvTipoReserva.MontaArvore;
 {Somente carrega a DbGrid depois que monta a arvore}
  bCarregaDbGrid := True;

  if qryArvore.IsEmpty then
     cmtvTipoReserva.Enabled := False
  else
     begin
          cmtvTipoReserva.Enabled := True;
          cmtvTipoReserva.SetFocus;
     end;
end;

procedure TfrmAssocBenefReserva.dblkpcmbBenefCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  AtualizaDbGrid;
end;

procedure TfrmAssocBenefReserva.sbtnAssociaClick(Sender: TObject);
var
  varfields : variant;
begin
  inherited;
  if Trim(dblkpcmbBenef.Text) = '' then
     begin
          MsgDlg('O Benefício deve ser informado.','Erro',mtError,[mbOk,mbHelp],0);
          dblkpcmbBenef.SetFocus;
          Exit;
     end;

  if qryArvore.FieldByName('ANALITICOSINTETI').AsString = 'S' then
     begin
          MsgDlg('Esta Reserva é Sintética!','Informação',mtInformation,[mbOk,mbHelp],0);
          cmtvTipoReserva.SetFocus;
          Exit;
     end;

 {Verifica se o registro ja existe}
  if not qryBenefReserva.IsEmpty then
     begin
          varFields := VarArrayCreate([0,2],varVariant);
          varFields[0] := sIdPlano;
          varFields[1] := qryBenef.FieldByName('IDBENEFICIO').AsString;
          varFields[2] := qryArvore.FieldByName('IDTIPORESERVA').AsString;

          if qryBenefReserva.Locate('IDPLANOPREV;IDBENEFICIO;IDTIPORESERVA',varFields,[loCaseInsensitive, loPartialKey]) then
             begin
                  MsgDlg('Esta Reserva já está cadastrada neste Benefício.','Erro',mtError,[mbOk,mbHelp],0);
                  Exit;
             end;
     end;
 {Fim - Verifica se o registro ja existe}


  with frmLerRegraBenefReserva do
  begin
      lblPlano.Caption     := 'Plano '     + sNomePlano;
      lblReserva.Caption   := 'Reserva '   + qryArvore.FieldByName('NOME').AsString;
      lblBeneficio.Caption := 'Benefício ' + qryBenef.FieldByName('NOME').AsString;
      ShowModal;
      if bBotaoOk = False then
         exit;
  end;


 {Grava}
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' INSERT INTO BENEFRESERVA(IDPLANOPREV, NUMORDEM, IDBENEFICIO, ' +
                 '                          IDTIPORESERVA, IDREGRAABATERESE) ' +
                 ' VALUES(' + sIdPlano + ',' + frmLerRegraBenefReserva.edNumOrdem.Text + ',' +
                              qryBenef.FieldByName('IDBENEFICIO').AsString + ',' +
                              qryArvore.FieldByName('IDTIPORESERVA').AsString + ',' +
                              frmLerRegraBenefReserva.sRegraAbateReserva + ')');
  try
     qryAux.ExecSQL;
  except
     on E: EDBEngineError do begin
        MostrarErro(E);
        Exit;
     end;
  end;
 {Fim - Grava}

 {Guarda Chave}
  varFields := VarArrayCreate([0,2],varVariant);
  varFields[0] := sIdPlano;
  varFields[1] := qryBenef.FieldByName('IDBENEFICIO').AsString;
  varFields[2] := qryArvore.FieldByName('IDTIPORESERVA').AsString;

  AtualizaDbGrid;

 {Para posicinar no registro que estava}
  qryBenefReserva.Locate('IDPLANOPREV;IDBENEFICIO;IDTIPORESERVA',varFields,[loCaseInsensitive, loPartialKey]);

    
    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption + ' - Associando Benefício') Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

procedure TfrmAssocBenefReserva.sbtnDesassociaClick(Sender: TObject);
begin
  inherited;
  if Trim(dblkpcmbBenef.Text) = '' then
     begin
          MsgDlg('O Benefício deve ser informado.','Erro',mtError,[mbOk,mbHelp],0);
          dblkpcmbBenef.SetFocus;
          Exit;
     end;

  if qryBenefReserva.FieldByName('IDTIPORESERVA').AsString = '' then
     begin
          MsgDlg('Primeiro selecione a Reserva.','Erro',mtError,[mbOk,mbHelp],0);
          dbgBenefReserva.SetFocus;
          Exit;
     end;


 {Deleta}
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' DELETE FROM BENEFRESERVA ' +
                 ' WHERE IDPLANOPREV   = ' + sIdPlano + ' AND ' +
                 '       IDTIPORESERVA = ' + qryBenefReserva.FieldByName('IDTIPORESERVA').AsString + ' AND ' +
                 '       IDBENEFICIO   = ' + qryBenef.FieldByName('IDBENEFICIO').AsString);
  try
     qryAux.ExecSQL;
  except
     on E: EDBEngineError do begin
        MostrarErro(E);
        Exit;
     end;
  end;

  AtualizaDbGrid;
end;

procedure TfrmAssocBenefReserva.mnuAlterarClick(Sender: TObject);
var
  varfields : variant;
begin
  inherited;
  if Trim(dblkpcmbBenef.Text) = '' then
     begin
          MsgDlg('O Benefício deve ser informado.','Erro',mtError,[mbOk,mbHelp],0);
          dblkpcmbBenef.SetFocus;
          Exit;
     end;

  if qryBenefReserva.FieldByName('IDTIPORESERVA').AsString = '' then
     begin
          MsgDlg('Primeiro selecione a Reserva.','Erro',mtError,[mbOk,mbHelp],0);
          dbgBenefReserva.SetFocus;
          Exit;
     end;


  with frmLerRegraBenefReserva do
  begin
      bAlteraRegra := True;
      lblPlano.Caption     := 'Plano '     + sNomePlano;
      lblReserva.Caption   := 'Reserva '   + qryArvore.FieldByName('NOME').AsString;
      lblBeneficio.Caption := 'Benefício ' + qryBenef.FieldByName('NOME').AsString;
      ShowModal;
      if bBotaoOk = False then
         begin
              bAlteraRegra := False;
              exit;
         end;
  end;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' UPDATE BENEFRESERVA SET NUMORDEM = ' + frmLerRegraBenefReserva.edNumOrdem.Text + ',' +
                 '                         IDREGRAABATERESE = ' + frmLerRegraBenefReserva.sRegraAbateReserva +
                 ' WHERE IDPLANOPREV   = ' + sIdPlano + ' AND ' +
                 '       IDTIPORESERVA = ' + qryBenefReserva.FieldByName('IDTIPORESERVA').AsString + ' AND ' +
                 '       IDBENEFICIO   = ' + qryBenef.FieldByName('IDBENEFICIO').AsString);
  try
     qryAux.ExecSQL;
  except
     on E: EDBEngineError do begin
        MostrarErro(E);
        frmLerRegraBenefReserva.bAlteraRegra := False;
        Exit;
     end;
  end;

  frmLerRegraBenefReserva.bAlteraRegra := False;

 {Guarda Chave}
  varFields := VarArrayCreate([0,2],varVariant);
  varFields[0] := sIdPlano;
  varFields[1] := qryBenef.FieldByName('IDBENEFICIO').AsString;
  varFields[2] := qryBenefReserva.FieldByName('IDTIPORESERVA').AsString;

  AtualizaDbGrid;

 {Para posicinar no registro que estava}
  qryBenefReserva.Locate('IDPLANOPREV;IDBENEFICIO;IDTIPORESERVA',varFields,[loCaseInsensitive, loPartialKey]);

    
    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption + ' - Desassociando Benefício') Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

procedure TfrmAssocBenefReserva.AtualizaDbGrid;
begin
 {Refresh}
  qryBenefReserva.Close;
  qryBenefReserva.ParamByName('pIdPlanoPrev').AsString := sIdPlano;
  qryBenefReserva.ParamByName('pIdBeneficio').AsString := qryBenef.FieldByName('IDBENEFICIO').AsString;
  qryBenefReserva.Open;
end;

end.



