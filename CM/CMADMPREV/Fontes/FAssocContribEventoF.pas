// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 16.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FAssocContribEventoF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FTelaAut, StdCtrls, Buttons, MAHlpBtn, ExtCtrls, DBCtrls, Db, Wwdatsrc,
  DBTables, Wwquery, Grids, DBGrids, Wwdbigrd, Wwdbgrid, Menus, FSairAjuda,
  TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti;

type
  TfrmAssocContribEventoF = class(TfrmSairAjuda)
    Panel4: TPanel;
    lbPatro: TLabel;
    dsPlanPrev: TwwDataSource;
    dsContPrevEvento: TwwDataSource;
    qryContPrevEvento: TwwQuery;
    qryPlanPrev: TwwQuery;
    qryAux: TwwQuery;
    dbgrdPlanos: TDBGrid;
    qryContPrev: TwwQuery;
    Panel5: TPanel;
    lbPlanoNao: TLabel;
    sbtnAssocia: TSpeedButton;
    sbtnAssociaTodos: TSpeedButton;
    sbtnDesassocia: TSpeedButton;
    sbtnDesassociaTodos: TSpeedButton;
    lblPlanPatro: TLabel;
    dblkplistContribNaoAssoc: TDBLookupListBox;
    dbgrdContribAssoc: TwwDBGrid;
    dbgrdEventos: TDBGrid;
    Label1: TLabel;
    dsEventoGerador: TwwDataSource;
    qryEventoGerador: TwwQuery;
    dsContPrev: TwwDataSource;
    pmenu: TPopupMenu;
    mnuAlterar: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure sbtnAssociaClick(Sender: TObject);
    procedure sbtnAssociaTodosClick(Sender: TObject);
    procedure sbtnDesassociaClick(Sender: TObject);
    procedure sbtnDesassociaTodosClick(Sender: TObject);
    procedure AtualizaGrids;
    procedure qryPlanPrevAfterScroll(DataSet: TDataSet);
    procedure dblkplistContribNaoAssocMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbgrdContribAssocMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dblkplistContribNaoAssocDragDrop(Sender, Source: TObject; X,Y: Integer);
    procedure dblkplistContribNaoAssocDragOver(Sender, Source: TObject; X,Y: Integer; State: TDragState; var Accept: Boolean);
    procedure dbgrdContribAssocDragDrop(Sender, Source: TObject; X,Y: Integer);
    procedure dbgrdContribAssocDragOver(Sender, Source: TObject; X,Y: Integer; State: TDragState; var Accept: Boolean);
    procedure qryEventoGeradorAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure mnuAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAssocContribEventoF: TfrmAssocContribEventoF;

implementation

uses
    UMensErro, UAdmPrev, FLerRegraContribEventoF, Usistema;

{$R *.DFM}

procedure TfrmAssocContribEventoF.FormActivate(Sender: TObject);
begin
  inherited;
  
  with qryPlanPrev do
  begin
     Close;
     SQl.Clear;
     SQL.Add(' SELECT IDPLANOPREV, NOME  FROM PLANPREV '+
             ' WHERE IDPLANOPREV IN (SELECT PLP.IDPLANOPREV FROM PLANPREVPATRO PLP, PATRO P '+
             '                          WHERE   P.IDFUNDACAO = '+IntToStr(iIdFundacao)       +
             '                          AND     PLP.IDPESSJUR = P.IDPESSOA )                 '+
             ' ORDER BY NOME                                                                 ');
     Open;
  end;
  qryEventoGerador.Close;
  qryEventoGerador.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
  qryEventoGerador.Open;

  qryContPrevEvento.Close;
  qryContPrevEvento.ParamByName('pIdPlanoPrev').AsString     := qryPlanPrev.FieldByName('IDPLANOPREV').AsString;
  qryContPrevEvento.ParamByName('pIdEventoGerador').AsString := qryEventoGerador.FieldByName('IDEVENTOGERADOR').AsString;
  qryContPrevEvento.Open;

  qryContPrev.Close;
  qryContPrev.SQL.Clear;
  qryContPrev.SQL.Add(' SELECT  CP.IDPLANOPREV, CP.IDCONTRIBUICAO, C.NOME  '+
                      ' FROM    CONTPREV CP, CONTRIBUICAO C                '+
                      ' WHERE   CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO       ');
  qryContPrev.SQL.Add(' AND     CP.IDPLANOPREV    = '+OraNumero(qryPlanPrev.FieldByName('IDPLANOPREV').AsString));

  qryContPrev.SQL.Add(' AND     NOT EXISTS( SELECT CE.IDCONTRIBUICAO       '+
                      '                     FROM   CONTPREVEVENTO CE       '+
                      '                     WHERE  CE.IDCONTRIBUICAO  = CP.IDCONTRIBUICAO '+
                      '                     AND    CE.IDPLANOPREV     = CP.IDPLANOPREV       '+
                      '                     AND    CE.IDEVENTOGERADOR = '+OraNumero(qryEventoGerador.FieldByName('IDEVENTOGERADOR').AsString)+') '+
                      ' ORDER BY C.NOME ');
  qryContPrev.Open;
end;

procedure TfrmAssocContribEventoF.FormShow(Sender: TObject);
begin
  inherited;
  frmLerRegraContribEventoF.bAlteraRegra := False;


end;

procedure TfrmAssocContribEventoF.sbtnAssociaClick(Sender: TObject);
begin
  inherited;

  with frmLerRegraContribEventoF do
  begin
      bAlteraRegra := False;
      lblPlano.Caption        := 'Plano '  + qryPlanPrev.FieldByName('NOME').AsString;
      lblEvento.Caption       := 'Evento ' + qryEventoGerador.FieldByName('NOME').AsString;
      lblContribuicao.Caption := 'Contribuição ' + qryContPrev.FieldByName('NOME').AsString;
      ShowModal;
      if bBotaoOk = False then
         exit;
  end;


  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' INSERT INTO CONTPREVEVENTO(IDPLANOPREV, IDEVENTOGERADOR, IDCONTRIBUICAO, IDREGRAVALIDAASS) '+
                 ' VALUES(' + qryPlanPrev.FieldByName('IDPLANOPREV').AsString + ',' +
                              qryEventoGerador.FieldByName('IDEVENTOGERADOR').AsString + ',' +
                              qryContPrev.FieldByName('IDCONTRIBUICAO').AsString + ',' +
                              frmLerRegraContribEventoF.sRegraValidaAssoc + ')');
  try
     qryAux.ExecSQL;
  except
     on E:EDBEngineError do
       begin
            MostrarErro(E);
            Exit;
       end;
  end;

    
    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption + ' - Associando Contribuição') Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;


  AtualizaGrids;
end;

procedure TfrmAssocContribEventoF.sbtnAssociaTodosClick(Sender: TObject);
begin
  inherited;
  qryContPrev.First;
  while not qryContPrev.EOF do
      begin
           with frmLerRegraContribEventoF do
           begin
                bAlteraRegra := False;
                lblPlano.Caption        := 'Plano '  + qryPlanPrev.FieldByName('NOME').AsString;
                lblEvento.Caption       := 'Evento ' + qryEventoGerador.FieldByName('NOME').AsString;
                lblContribuicao.Caption := 'Contribuição ' + qryContPrev.FieldByName('NOME').AsString;
                ShowModal;
                if bBotaoOk = False then
                   exit;
           end;


           qryAux.Close;
           qryAux.SQL.Clear;
           qryAux.SQL.Add(' INSERT INTO CONTPREVEVENTO(IDPLANOPREV, IDEVENTOGERADOR, IDCONTRIBUICAO, IDREGRAVALIDAASS) '+
                          ' VALUES(' + qryPlanPrev.FieldByName('IDPLANOPREV').AsString + ',' +
                                       qryEventoGerador.FieldByName('IDEVENTOGERADOR').AsString + ',' +
                                       qryContPrev.FieldByName('IDCONTRIBUICAO').AsString + ',' +
                                       frmLerRegraContribEventoF.sRegraValidaAssoc + ')');
           try
              qryAux.ExecSQL;
           except
              on E:EDBEngineError do
                 begin
                      MostrarErro(E);
                      Exit;
                 end;
           end;

           qryContPrev.Next;
      end;

    
    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption+ ' - Associando Contribuições') Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

  AtualizaGrids;
end;

procedure TfrmAssocContribEventoF.sbtnDesassociaClick(Sender: TObject);
begin
  inherited;
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' DELETE FROM CONTPREVEVENTO ' +
                 ' WHERE IDPLANOPREV     = ' + qryPlanPrev.FieldByName('IDPLANOPREV').AsString + ' AND ' +
                 '       IDEVENTOGERADOR = ' + qryEventoGerador.FieldByName('IDEVENTOGERADOR').AsString + ' AND ' +
                 '       IDCONTRIBUICAO  = ' + qryContPrevEvento.FieldByName('IDCONTRIBUICAO').AsString);
  try
     qryAux.ExecSQL;
  except
     on E:EDBEngineError do
       begin
            MostrarErro(E);
            Exit;
       end;
  end;
    
    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption+ ' - Desassociando Contribuição' ) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

  AtualizaGrids;
end;

procedure TfrmAssocContribEventoF.sbtnDesassociaTodosClick(Sender: TObject);
begin
  inherited;
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' DELETE FROM CONTPREVEVENTO ' +
                 ' WHERE IDPLANOPREV     = ' + qryPlanPrev.FieldByName('IDPLANOPREV').AsString + ' AND ' +
                 '       IDEVENTOGERADOR = ' + qryEventoGerador.FieldByName('IDEVENTOGERADOR').AsString);
  try
     qryAux.ExecSQL;
  except
     on E:EDBEngineError do
       begin
            MostrarErro(E);
            Exit;
       end;
  end;

    
    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption+ ' - Desassociando Contribuições') Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;
  AtualizaGrids;
end;

procedure TfrmAssocContribEventoF.qryPlanPrevAfterScroll(DataSet: TDataSet);
begin
  inherited;
  AtualizaGrids;
end;

procedure TfrmAssocContribEventoF.qryEventoGeradorAfterScroll(DataSet: TDataSet);
begin
  inherited;
  AtualizaGrids;
end;

procedure TfrmAssocContribEventoF.AtualizaGrids;
begin
  if (qryPlanPrev.State in [dsInactive]) or (qryEventoGerador.State in [dsInactive]) then
      exit;

  qryContPrevEvento.Close;
  qryContPrevEvento.ParamByName('pIdPlanoPrev').AsString     := qryPlanPrev.FieldByName('IDPLANOPREV').AsString;
  qryContPrevEvento.ParamByName('pIdEventoGerador').AsString := qryEventoGerador.FieldByName('IDEVENTOGERADOR').AsString;
  qryContPrevEvento.Open;

  qryContPrev.Close;
  qryContPrev.SQL.Clear;
  qryContPrev.SQL.Add(' SELECT  CP.IDPLANOPREV, CP.IDCONTRIBUICAO, C.NOME  '+
                      ' FROM    CONTPREV CP, CONTRIBUICAO C                '+
                      ' WHERE   CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO       ');
  qryContPrev.SQL.Add(' AND     CP.IDPLANOPREV    = '+qryPlanPrev.FieldByName('IDPLANOPREV').AsString);
  qryContPrev.SQL.Add(' AND     NOT EXISTS( SELECT CE.IDCONTRIBUICAO       '+
                      '                     FROM   CONTPREVEVENTO CE       '+
                      '                     WHERE  CE.IDCONTRIBUICAO  = CP.IDCONTRIBUICAO '+
                      '                     AND    CE.IDPLANOPREV     = CP.IDPLANOPREV       '+
                      '                     AND    CE.IDEVENTOGERADOR = '+qryEventoGerador.FieldByName('IDEVENTOGERADOR').AsString+') '+
                      ' ORDER BY C.NOME ');
  qryContPrev.Open;
end;

procedure TfrmAssocContribEventoF.dblkplistContribNaoAssocMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Sender is TDBLookUpListBox then
     TDBLookUplistBox(Sender).BeginDrag(True);
end;

procedure TfrmAssocContribEventoF.dbgrdContribAssocMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Button = mbLeft
  then if Sender is TwwDBGrid
       then TwwDBGrid(Sender).BeginDrag(True);
end;

procedure TfrmAssocContribEventoF.dblkplistContribNaoAssocDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  inherited;
  TwwDbGrid(Sender).EndDrag(True);
  sbtnDesassociaClick(Sender);
end;

procedure TfrmAssocContribEventoF.dblkplistContribNaoAssocDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := False;

  if (not qryContPrevEvento.Active) or (not qryContPrev.Active) then Exit;

  if (Source is TwwDBGrid)
  then
     { Se o drag não vier do grid, cancelar }
     Accept := True;
end;

procedure TfrmAssocContribEventoF.dbgrdContribAssocDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  inherited;
  TdbLookUpListBox(Sender).EndDrag(True);
  sbtnAssociaClick(Sender);
end;

procedure TfrmAssocContribEventoF.dbgrdContribAssocDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := False;

  if (not qryContPrevEvento.Active) or (not qryContPrev.Active) then Exit;

  if (Source is TDBLookUpListBox)
  then
     { Se o drag não vier da lista de plano, cancelar }
     Accept := True;
end;

procedure TfrmAssocContribEventoF.mnuAlterarClick(Sender: TObject);
begin
  inherited;
  with frmLerRegraContribEventoF do
  begin
      bAlteraRegra := True;
      lblPlano.Caption        := 'Plano '  + qryPlanPrev.FieldByName('NOME').AsString;
      lblEvento.Caption       := 'Evento ' + qryEventoGerador.FieldByName('NOME').AsString;
      lblContribuicao.Caption := 'Contribuição ' + qryContPrevEvento.FieldByName('NOME').AsString;
      ShowModal;
      if bBotaoOk = False then
         exit;
  end;


  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' UPDATE CONTPREVEVENTO SET IDREGRAVALIDAASS = ' + frmLerRegraContribEventoF.sRegraValidaAssoc +
                 ' WHERE IDPLANOPREV     = ' + qryPlanPrev.FieldByName('IDPLANOPREV').AsString          + ' AND ' +
                 '       IDEVENTOGERADOR = ' + qryEventoGerador.FieldByName('IDEVENTOGERADOR').AsString + ' AND ' +
                 '       IDCONTRIBUICAO  = ' + qryContPrevEvento.FieldByName('IDCONTRIBUICAO').AsString);
  try
     qryAux.ExecSQL;
  except
     on E:EDBEngineError do
       begin
            MostrarErro(E);
            Exit;
       end;
  end;

  AtualizaGrids;
end;

end.
