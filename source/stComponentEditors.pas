unit stComponentEditors;

interface

uses Classes, DesignEditors, DesignIntf;

const
  C_VERB_VERSION = '版本信息 &Version';
  C_ADD_TABITEM = '新建页面 &New TabItem';
  C_NEXT_TABITEM = '下一页面 Next &TabItem';
  C_PREV_TABITEM = '前一页面 &Previous TabItem';

type


  TstBaseComponentEditor = class(TComponentEditor)
  private
    FVerbs: TStringList;
  protected
    procedure BuildVerbs(AVerbs: TStrings); virtual;
  public
    constructor Create(AComponent: TComponent; ADesigner: IDesigner); override;
    destructor Destroy; override;
    function GetVerbCount: integer; override;
    function GetVerb(Index: integer): string; override;
    procedure ExecuteVerb(Index: integer); override;
  end;

  TNavigationPageControlComponentEditor = class(TstBaseComponentEditor)
  private
  protected
    procedure BuildVerbs(AVerbs: TStrings); override;
  public
    procedure ExecuteVerb(Index: integer); override;
  end;




  procedure Register;

implementation

uses SysUtils, FMX.Types, FMX.Dialogs, NavigationPageControl;

procedure Register;
begin
  RegisterComponentEditor(TNavigationPageControl, TNavigationPageControlComponentEditor);
  RegisterComponentEditor(TNavTabItem, TNavigationPageControlComponentEditor);
end;


{ TNavigationPageControlComponentEditor }

procedure TNavigationPageControlComponentEditor.BuildVerbs(AVerbs: TStrings);
begin
  inherited;
  AVerbs.Add(C_ADD_TABITEM);
  AVerbs.Add('-');
  AVerbs.Add(C_PREV_TABITEM);
  AVerbs.Add(C_NEXT_TABITEM);
  AVerbs.Add(C_VERB_VERSION);
end;

procedure TNavigationPageControlComponentEditor.ExecuteVerb(Index: integer);
var
  ItemParent: TFmxObject;
  ATabControl: TNavigationPageControl;
begin
  inherited;
  ATabControl := nil;
  if Component is TNavigationPageControl then
    ATabControl := (Component as TNavigationPageControl);
  if Component is TNavTabItem then
    ATabControl := TNavigationPageControl(TNavTabItem(Component).Parent);

  if FVerbs[Index] = C_ADD_TABITEM then
  begin
    if ATabControl <> nil then
    begin
      ItemParent := TFmxObject((ATabControl as IItemsContainer).GetObject);
      Designer.CreateChild(TNavTabItem, ItemParent);
    end;
  end;
  if FVerbs[Index] = C_PREV_TABITEM then
    ATabControl.PrevTab;
  if FVerbs[Index] = C_NEXT_TABITEM then
    ATabControl.NextTab;

end;

{ TksBaseComponentEditor }

procedure TstBaseComponentEditor.BuildVerbs(AVerbs: TStrings);
begin
end;

constructor TstBaseComponentEditor.Create(AComponent: TComponent; ADesigner: IDesigner);
begin
  inherited;
  FVerbs := TStringList.Create;
  BuildVerbs(FVerbs);
  if FVerbs.Count > 0 then
    FVerbs.Add('-');
  FVerbs.Add(C_VERB_VERSION);
  FVerbs.Add('-');
end;

destructor TstBaseComponentEditor.Destroy;
begin
  FVerbs.Free;
  inherited;
end;

procedure TstBaseComponentEditor.ExecuteVerb(Index: integer);
begin
  inherited;
  if FVerbs[Index] = C_VERB_VERSION then
    ShowMessage('Version 1.0.0.0 please help star the project, thanks' + #13 + #13 + 'https://github.com/soastao/NavigationPageControl' + #13 + #13 + '20200219 by soastao');
end;

function TstBaseComponentEditor.GetVerb(Index: integer): string;
begin
  Result := FVerbs[Index];
end;

function TstBaseComponentEditor.GetVerbCount: integer;
begin
  Result := FVerbs.Count;
end;



end.
