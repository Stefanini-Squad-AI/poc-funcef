unit cmseldlg;

interface    

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes,
  Graphics, Controls, Forms, Dialogs,stdctrls, DB, FSele;

type
   TcmSelectDlg = class(TComponent)
   private
      FCaption: string;
      FDataSet: TDataSet;
      FFieldNames: TStrings;
      FDisplayLabels: TStrings;
      FHelpContext: THelpContext;
      FAlwaysShow: Boolean;
      FSearchControls: Boolean;
      
   protected

   public
      constructor Create(AOwner:TComponent); override;
      destructor Destroy; override;
      function Execute: boolean;
      procedure SetFieldNames(Value: TStrings);
      procedure SetDisplayLabels(Value: TStrings);

   published
      property SearchControls: Boolean read FSearchControls write FSearchControls;
      property Caption: string read FCaption write FCaption;
      property DataSet: TDataSet read FDataSet write FDataSet;
      property FieldNames: TStrings read FFieldNames write SetFieldNames;
      property DisplayLabels: TStrings read FDisplayLabels write SetDisplayLabels;
      property AlwaysShow: Boolean read FAlwaysShow write FAlwaysShow;
      property HelpContext: THelpContext read FHelpContext write FHelpContext;
      property Name;
      property Tag;

   end;

implementation

//{$R *.res}

var
   frmSelecionar: TfrmSelec;


constructor TcmSelectDlg.Create(AOwner:TComponent);
begin
   inherited Create(AOwner);
   FFieldNames    := TStringList.Create;
   FDisplayLabels := TStringList.Create;
end;

destructor TcmSelectDlg.Destroy;
begin
   FFieldNames.Free;
   FDisplayLabels.Free;
   inherited Destroy;
end;

function TcmSelectDlg.Execute: boolean;
begin
   frmSelecionar  := TfrmSelec.Create(Application);
   case FDataSet.RecordCount of
      0: Result := False;
      1: if FAlwaysShow then
            Result := frmSelecionar.SelecionarEx(FDataSet,
                                                TStringList(FFieldNames),
                                                TStringList(FDisplayLabels),
                                                FCaption,
                                                SearchControls,
                                                FHelpContext)
         else Result := True;
      else Result := frmSelecionar.SelecionarEx(FDataSet,
                                                TStringList(FFieldNames),
                                                TStringList(FDisplayLabels),
                                                FCaption,
                                                SearchControls,
                                                FHelpContext);
   end; {case}
   frmSelecionar.Free;
end;

procedure TcmSelectDlg.SetFieldNames(Value: TStrings);
begin
   FFieldNames.Assign(Value);
end;

procedure TcmSelectDlg.SetDisplayLabels(Value: TStrings);
begin
   FDisplayLabels.Assign(Value);
end;

end.

